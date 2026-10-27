import ProviderConfig from "../models/provider.model.js";
import smeplugService from "./smeplug.service.js";
import topupmateService from "./topupmate.service.js";
import vtpassService from "./vtpass.service.js";

interface ProviderClient {
  getNetworks?: () => Promise<any>;
  getDataPlans?: () => Promise<any>;
  getCableProviders?: () => Promise<any>;
  getCableTVPlans?: () => Promise<any>;
  getElectricityProviders?: () => Promise<any>;
  getExamPinProviders?: () => Promise<any>;
  purchaseAirtime?: (data: any) => Promise<any>;
  purchaseData?: (data: any) => Promise<any>;
  verifyCableAccount?: (data: any) => Promise<any>;
  purchaseCableTV?: (data: any) => Promise<any>;
  verifyElectricityMeter?: (data: any) => Promise<any>;
  purchaseElectricity?: (data: any) => Promise<any>;
  purchaseExamPin?: (data: any) => Promise<any>;
  getTransactionStatus?: (reference: string) => Promise<any>;
  getWalletBalance?: () => Promise<any>;
}

class ProviderRegistryService {
  private clients: Record<string, ProviderClient> = {
    topupmate: topupmateService,
    vtpass: vtpassService,
    smeplug: smeplugService,
  };

  register(code: string, client: ProviderClient) {
    this.clients[code] = client;
  }

  getClient(code: string): ProviderClient | undefined {
    return this.clients[code];
  }

  async getPreferredProviderFor(
    service: string,
  ): Promise<{ code: string; client: ProviderClient } | null> {
    const providers = await ProviderConfig.find({
      active: true,
      supported_services: { $in: [service] },
    }).sort({ priority: 1, name: 1 });

    const preferredOrder = ["smeplug", "topupmate", "vtpass"];
    const providerMap = new Map(providers.map((p) => [p.code, p]));

    for (const code of preferredOrder) {
      const provider = providerMap.get(code);
      if (!provider) continue;

      const client = this.getClient(provider.code);
      if (client) return { code: provider.code, client };
    }

    for (const p of providers) {
      const client = this.getClient(p.code);
      if (client) return { code: p.code, client };
    }

    const fallback = this.getClient("topupmate");
    return fallback ? { code: "topupmate", client: fallback } : null;
  }
}

export const providerRegistry = new ProviderRegistryService();
export default providerRegistry;

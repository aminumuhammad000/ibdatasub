jest.mock("../../src/models/provider.model.js", () => ({
  __esModule: true,
  default: {
    find: jest.fn(),
  },
}));

import ProviderConfig from "../../src/models/provider.model.js";
import providerRegistry from "../../src/services/providerRegistry.service.js";

describe("ProviderRegistryService.getPreferredProviderFor", () => {
  beforeEach(() => {
    jest.clearAllMocks();
  });

  it("prefers SMEPlug for airtime and data even when another provider has a lower priority", async () => {
    (ProviderConfig.find as jest.Mock).mockResolvedValue([
      {
        code: "topupmate",
        active: true,
        priority: 1,
        supported_services: ["airtime", "data"],
      },
      {
        code: "smeplug",
        active: true,
        priority: 2,
        supported_services: ["airtime", "data"],
      },
    ]);

    const airtimeResult =
      await providerRegistry.getPreferredProviderFor("airtime");
    const dataResult = await providerRegistry.getPreferredProviderFor("data");

    expect(airtimeResult?.code).toBe("smeplug");
    expect(dataResult?.code).toBe("smeplug");
  });
});

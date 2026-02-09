import { AirtimeToCashRequest } from '../models/airtime_to_cash.model.js';
import { AirtimeToCashSetting } from '../models/airtime_to_cash_setting.model.js';
export const AirtimeToCashController = {
    submitRequest: async (req, res) => {
        try {
            const { network, phone_number, amount } = req.body;
            const userId = req.user.userId; // Assuming auth middleware adds user
            // Basic validation
            if (!network || !phone_number || !amount) {
                return res.status(400).json({ success: false, message: 'All fields are required' });
            }
            // Fetch settings for this network
            const setting = await AirtimeToCashSetting.findOne({ network, is_active: true });
            if (!setting) {
                return res.status(400).json({ success: false, message: 'This network is currently not supported for Airtime to Cash' });
            }
            if (amount < setting.min_amount || amount > setting.max_amount) {
                return res.status(400).json({ success: false, message: `Amount must be between ₦${setting.min_amount} and ₦${setting.max_amount}` });
            }
            const amount_to_receive = (amount * setting.conversion_rate) / 100;
            const newRequest = new AirtimeToCashRequest({
                user_id: userId,
                network,
                phone_number,
                amount,
                amount_to_receive
            });
            await newRequest.save();
            res.status(201).json({
                success: true,
                message: 'Airtime to Cash request submitted successfully',
                data: newRequest
            });
        }
        catch (error) {
            console.error('Submit Airtime to Cash Error:', error);
            res.status(500).json({ success: false, message: 'Server Error' });
        }
    },
    getMyRequests: async (req, res) => {
        try {
            const userId = req.user.userId;
            const requests = await AirtimeToCashRequest.find({ user_id: userId }).sort({ created_at: -1 });
            res.status(200).json({
                success: true,
                data: requests
            });
        }
        catch (error) {
            console.error('Get My Requests Error:', error);
            res.status(500).json({ success: false, message: 'Server Error' });
        }
    },
    getSettings: async (req, res) => {
        try {
            const settings = await AirtimeToCashSetting.find({ is_active: true });
            res.status(200).json({
                success: true,
                data: settings
            });
        }
        catch (error) {
            console.error('Get Settings Error:', error);
            res.status(500).json({ success: false, message: 'Server Error' });
        }
    }
};

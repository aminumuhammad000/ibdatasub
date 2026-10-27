-- ==============================================================================
-- MongoDB Backup Migration to Supabase
-- Source: mongodb-backup-2026-07-13.tar.gz
-- Generated: 2026-10-27T13:29:48.812Z
-- ==============================================================================

-- 1. Insert Admin Users
INSERT INTO admin_users (id, email, password_hash, first_name, last_name, role, status, last_login_at, created_at, updated_at)
VALUES ('00000000-6913-80a2-e3ba-eb2c24cb7bbf', 'murabusdatas@gmail.com', '$2b$10$v0tb/.0eNYoHcRyeTbf4uuyMupijHXDdhyKR5eBmWGw9JNx99xi6i', 'IBRAHIM', 'MURABUS', 'super_admin', 'active', '2026-07-13T11:12:57.383Z', '2025-11-11T18:29:54.442Z', '2026-05-01T13:06:04.038Z')
ON CONFLICT (email) DO UPDATE SET password_hash = EXCLUDED.password_hash, first_name = EXCLUDED.first_name, last_name = EXCLUDED.last_name;
INSERT INTO admin_users (id, email, password_hash, first_name, last_name, role, status, last_login_at, created_at, updated_at)
VALUES ('00000000-6953-01eb-2328-8670bbff4d5a', 'admin@vtuapp.com', '$2b$10$5lTxJyv88W5GA5VqlfsSxupXRKmnl4diyW3VzUhF34ZPalS9CSvcO', 'Admin', 'User', 'super_admin', 'active', '2026-06-18T09:31:51.029Z', '2025-12-29T22:34:19.711Z', '2025-12-29T22:34:19.712Z')
ON CONFLICT (email) DO UPDATE SET password_hash = EXCLUDED.password_hash, first_name = EXCLUDED.first_name, last_name = EXCLUDED.last_name;
INSERT INTO admin_users (id, email, password_hash, first_name, last_name, role, status, last_login_at, created_at, updated_at)
VALUES ('00000000-6913-7b01-45f8-5a28e21733c6', 'admin@connectavtu.com', '$2b$10$xPvtmByvfRNQYLC.M.fPmufuGka78Glm4Mrslt3Mwo41Tna8LODXa', 'Super', 'Admin', 'super_admin', 'active', NULL, '2025-11-11T18:05:53.982Z', '2025-11-11T18:05:53.982Z')
ON CONFLICT (email) DO UPDATE SET password_hash = EXCLUDED.password_hash, first_name = EXCLUDED.first_name, last_name = EXCLUDED.last_name;

-- 2. Insert Users (315 total users)
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6913-26f6-13ca-4b97ddad1816', 'usman@gmail.com', '09068369394', '$2b$10$jSWYUnPaHtUHzZrES/s/teV.5wVM5FfWNa1G.HfOQ74aQr3EzutCq', 'Usman', 'Umar', 'Nigeria', 'pending', 'S018M88B', NULL, FALSE, '{"account_number":"6663433676","account_name":"Usman Umar(Payrant)","bank_name":"Payrant","account_reference":"691326f613ca4b97ddad1816-mhuj2g8c","provider":"payrant","status":"active"}'::jsonb, 'active', '2025-11-11T12:07:18.874Z', '2025-11-11T12:07:18.874Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-691c-8e9c-0905-272b76d063c7', 'ibrahimaligrk22@gmail.com', '09162989954', '$2b$10$M7vAhKXpZfQUQmXrPgIuxeLp0kSoifCz7lFw6NVFd9eaiaJ8eKGLG', 'MURABUS', 'DATA', 'Nigeria', 'verified', 'Y7K9CNUN', NULL, FALSE, '{"account_number":"6619249319","account_name":"IBRAHIM  ALI SANI(Payrant)","bank_name":"Payrant","account_reference":"691c8e9c0905272b76d063c7-mi5icxs5","provider":"payrant","status":"active"}'::jsonb, 'active', '2025-11-18T15:19:56.155Z', '2026-05-28T14:39:10.049Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-691c-a0cf-60fe-50767ffc3388', 'abdullahi@gmail.com', '08020253648', '$2b$10$j7aBJ9ZWF6tulgXazYLAreavT1mqAcswk9mttZq0Y0pzJkuCpJ25K', 'Abdullahi ', 'Musa', 'Nigeria', 'pending', '1NALYD1W', NULL, FALSE, '{"account_number":"6694633525","account_name":"Abdullahi  Musa(Payrant)","bank_name":"Payrant","account_reference":"691ca0cf60fe50767ffc3388-mi4ssk3f","provider":"payrant","status":"active"}'::jsonb, 'active', '2025-11-18T16:37:35.064Z', '2025-11-18T16:37:35.064Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6926-cf42-23d5-b6aac2873803', 'aaliyugarki@gmail.com', '09035738849', '$2b$10$Zl/Rgokt7afQ8nCoy.grxu3wh.KgaQ.jv.Zwtj6ASPyUmvZWK4W1K', 'Abdullahi ', 'Aliyu', 'Nigeria', 'pending', 'YB5Q7Z3G', NULL, FALSE, '{"account_number":"6678842425","account_name":"Abdullahi  Aliyu(Payrant)","bank_name":"Payrant","account_reference":"6926cf4223d5b6aac2873803-mifu2tnh","provider":"payrant","status":"active"}'::jsonb, 'active', '2025-11-26T09:58:26.223Z', '2025-11-26T09:58:26.223Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6926-f16b-23d5-b6aac28739b1', 'halifakabirismail@gmail.com', '08133022988', '$2b$10$KqW.M1e7MPiaGFl3eKYhCOa3HtGdISsCTGcFNU9QQyjiff/J10UcO', 'Halifa', 'Kabir', 'Nigeria', 'pending', 'PWRMALGY', NULL, FALSE, '{}'::jsonb, 'active', '2025-11-26T12:24:11.145Z', '2025-11-26T12:37:22.541Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6927-20d9-4480-22289fe2d4dd', 'ahmadmukhtardudu@gmail.com', '08142203234', '$2b$10$mMMDfgnkEwoaW3UaYvIB1e8olRVTuPWGmsP72aCjrcNwNWRjkC55G', 'Ahmad ', 'Mukhtar ', 'Nigeria', 'pending', 'EGNUW6MP', NULL, FALSE, '{"account_number":"6626882468","account_name":"Ahmad  Mukhtar(Payrant)","bank_name":"Payrant","account_reference":"692720d9448022289fe2d4dd-mjabaoaf","provider":"payrant","status":"active"}'::jsonb, 'active', '2025-11-26T15:46:33.477Z', '2025-11-26T15:46:33.477Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6929-28ed-4480-22289fe2dd7a', 'lawansanigk@gmail.com', '08130989845', '$2b$10$0cF.MgLXd3xA4KoB2vkgpOy6Cp484SP0pMXApVnfBXrZ/VJY6VX1W', 'LAWAN ', 'SANI', 'Nigeria', 'pending', 'U9IRZN4E', NULL, FALSE, '{"account_number":"6620430027","account_name":"LAWAN  SANI(Payrant)","bank_name":"Payrant","account_reference":"692928ed448022289fe2dd7a-miidqjdu","provider":"payrant","status":"active"}'::jsonb, 'active', '2025-11-28T04:45:33.561Z', '2025-11-28T04:45:33.561Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-692a-0153-4480-22289fe2e12d', 'dayyabunasiru93@gmail.com', '09035027622', '$2b$10$5Seh0jvdZFvreu68k9M2AOqDoJCyof7P0thivnmO89vUd5nQKqXfm', 'NASEER', 'DAYYABU', 'Nigeria', 'pending', '2OE9P9FT', NULL, FALSE, '{"account_number":"6633079205","account_name":"NASIRU Dayyabu(Payrant)","bank_name":"Payrant","account_reference":"692a0153448022289fe2e12d-mijaqb0m","provider":"payrant","status":"active"}'::jsonb, 'active', '2025-11-28T20:08:51.016Z', '2025-11-29T21:17:28.392Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-692b-3546-4480-22289fe2e731', 'umargarki47@gmail.com', '08100124802', '$2b$10$xkuFxBhA7b3pA67AJeGH3eGeOnHmase0h55Jd/2FxT4C.L/.0.2.K', 'Umar', 'Abdullahi ', 'Nigeria', 'pending', 'N6I2XC33', NULL, FALSE, '{}'::jsonb, 'active', '2025-11-29T18:02:46.534Z', '2025-11-29T18:02:46.534Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-692b-d473-4480-22289fe2eac6', 'abdullahishu353@gmail.com', '07039217321', '$2b$10$NkYs1m.IH5.wvRgNYKM2ROhCdWjyJX3ksSfOJG1b0qjfoMcOjRrda', 'Abdullahi', 'Shehu', 'Nigeria', 'pending', 'YPDQ4YWL', NULL, FALSE, '{"account_number":"6670270144","account_name":"Abdullahi Shehu(Payrant)","bank_name":"Payrant","account_reference":"692bd473448022289fe2eac6-mil9x622","provider":"payrant","status":"active"}'::jsonb, 'active', '2025-11-30T05:21:55.913Z', '2025-11-30T05:21:55.913Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6934-9585-c7bf-7630650d2ffe', 'aliyumagajisani377@gmail.com', '9069065196', '$2b$10$xs0WpnC7OistOF1CsyBSduRAdepBKEYpUWnX3iskQv1mdS5ub1loS', 'Aliyu', 'Magaji Sani', 'Nigeria', 'pending', '5LLN4T27', NULL, FALSE, '{}'::jsonb, 'active', '2025-12-06T20:43:49.982Z', '2025-12-07T05:18:45.347Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6935-d3ec-eeea-3fc22a3b5b46', 'gamboabdullahi899@gmail.com', '08105860478', '$2b$10$xSWAhFKT513Zc0VZAIgAs.giK5K8aggzJ3PY/ZMOOlEQP00kSPIuC', 'Abdullahi', 'Gambo', 'Nigeria', 'pending', '0FR3HWRK', NULL, FALSE, '{"account_number":"6654366422","account_name":"Abdullahi Gambo(Payrant)","bank_name":"Payrant","account_reference":"6935d3eceeea3fc22a3b5b46-miw418yh","provider":"payrant","status":"active"}'::jsonb, 'active', '2025-12-07T19:22:20.281Z', '2025-12-07T19:22:20.281Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6935-d8aa-de74-fefd3f965890', 'aliyumagajisani662@gmail.com', '09069065196', '$2b$10$l8PuLtp4Pb7pCeg1MsDIGOdMSeHJgcBE8J/TtUHlTR9x8KVGW.pba', 'Aliyu', 'Sani Magaji', 'Nigeria', 'pending', 'HU89DKPA', NULL, FALSE, '{"account_number":"6601438678","account_name":"Aliyu Magaji Sani(Payrant)","bank_name":"Payrant","account_reference":"6935d8aade74fefd3f965890-miw4r9m4","provider":"payrant","status":"active"}'::jsonb, 'active', '2025-12-07T19:42:34.889Z', '2025-12-13T14:30:40.584Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6938-3b54-de74-fefd3f965c0e', 'abbayau271@gmail.com', '09032777576', '$2b$10$CkeYz8l3wS2yKdKV7a8zsulU1j1w.jLofBRK0RERXfHl0Zb6D4Nxi', 'Abba', 'Ya''u', 'Nigeria', 'pending', 'TP7PX46I', NULL, FALSE, '{"account_number":"6641135711","account_name":"Abba Ya''u(Payrant)","bank_name":"Payrant","account_reference":"69383b54de74fefd3f965c0e-miypv5u0","provider":"payrant","status":"active"}'::jsonb, 'active', '2025-12-09T15:08:04.329Z', '2025-12-09T15:08:04.329Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-693b-3e83-de74-fefd3f9661e7', 'rapcyguy48@gmail.com', '08143332991', '$2b$10$aMC.yd7vooxPumrCbz2pJuq1baW2FInqnMjpksuToAq2gzOyfCbuy', 'Aminu ', 'Abdullahi ', 'Nigeria', 'pending', '883BVIUC', NULL, FALSE, '{"account_number":"6671778505","account_name":"Aminu  Abdullahi(Payrant)","bank_name":"Payrant","account_reference":"693b3e83de74fefd3f9661e7-mj1zesxt","provider":"payrant","status":"active"}'::jsonb, 'active', '2025-12-11T21:58:27.243Z', '2025-12-11T21:58:27.243Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6940-794d-de74-fefd3f966b31', 'ibdatasub32@gmail.com', '09015890700', '$2b$10$SzmCHUhH5nAv7H2IpO8Hsu4N6nYNzU8blR1Ycf3OBn4Uu5zdnQ6I2', 'IBRAHIM', 'SHEHU', 'Nigeria', 'pending', 'YHTHD77A', NULL, FALSE, '{}'::jsonb, 'active', '2025-12-15T21:10:37.641Z', '2025-12-15T21:10:37.641Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6942-3820-eeea-3fc22a3b7092', 'nasirubiniyagrk@gmail.com', '09161030010', '$2b$10$bxr/Nfk1kPM2u8mQxrBGAeGmkbIpu57vNajp2cfDTvJVfHSh7uCdm', ' Nazifi', 'Yakubu', 'Nigeria', 'pending', 'FAUWDVR5', NULL, FALSE, '{"account_number":"6640137635","account_name":"Nazifi Yakubu(Payrant)","bank_name":"Payrant","account_reference":"69423820eeea3fc22a3b7092-mj9jhn5w","provider":"payrant","status":"active"}'::jsonb, 'active', '2025-12-17T04:57:04.159Z', '2025-12-17T04:57:04.159Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6944-3e1b-eeea-3fc22a3b7422', 'mutallibalasan1960@gmail.com', '08037379383', '$2b$10$ey4OMfQ1uTLM5M76dQjhoucmPR4W.yLqyhW4FCPvoDiMjkpkpmLZK', 'MUTALLIB', 'ALASAN', 'Nigeria', 'pending', 'CN0SOSO0', NULL, FALSE, '{"account_number":"6608776165","account_name":"MUTALLIB ALASAN(Payrant)","bank_name":"Payrant","account_reference":"69443e1beeea3fc22a3b7422-mjbqhi6f","provider":"payrant","status":"active"}'::jsonb, 'active', '2025-12-18T17:47:07.088Z', '2025-12-18T17:47:07.088Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6947-bc81-eeea-3fc22a3b7a9f', 'abubakaralawimuhammad041@gmail.com', '07070528202', '$2b$10$hZExsT3H90kc6UdvEuWRL.j8aSvxb/EGF8GMUMrMxrPHqP.9eUp/a', 'Muhammad ', 'Abubakar Alawi ', 'Nigeria', 'pending', 'RVXQCVBB', NULL, FALSE, '{"account_number":"6672758263","account_name":"Muhammad  Abubakar Alawi(Payrant)","bank_name":"Payrant","account_reference":"6947bc81eeea3fc22a3b7a9f-mjfislwb","provider":"payrant","status":"active"}'::jsonb, 'active', '2025-12-21T09:23:13.749Z', '2025-12-21T09:23:13.749Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6949-6b8b-eeea-3fc22a3b7dfd', 'mrauwal2002@gmail.com', '07037802427', '$2b$10$2yg.uga85UGA/MZQ3MPamezmdeJ10uzl9xiKExYpS4lCBIYEoXMge', 'Auwalu ', 'Aminu ', 'Nigeria', 'pending', '924E96Y7', NULL, FALSE, '{"account_number":"6687050341","account_name":"Auwalu  Aminu(Payrant)","bank_name":"Payrant","account_reference":"69496b8beeea3fc22a3b7dfd-mjhchgpd","provider":"payrant","status":"active"}'::jsonb, 'active', '2025-12-22T16:02:19.689Z', '2026-03-02T21:07:30.443Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-694a-a3fb-de74-fefd3f967de7', 'suwawiventures@gmail.com', '08033604564', '$2b$10$dHxU2Id4daV03RgzFi0M7uXAkDCINloztFQ6l0Yr9wxs0f7xG.j/C', 'ABUBAKAR', 'MUSBAHU', 'Nigeria', 'pending', 'CPBAQWNZ', NULL, FALSE, '{"account_number":"6696212607","account_name":"ABUBAKAR MUSBAHU(Payrant)","bank_name":"Payrant","account_reference":"694aa3fbde74fefd3f967de7-mjio3q5h","provider":"payrant","status":"active"}'::jsonb, 'active', '2025-12-23T14:15:23.031Z', '2025-12-23T14:15:23.031Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-694a-ebec-de74-fefd3f967e83', 'dahiruganja9166@gmail.com', '07064434574', '$2b$10$Neyuvy./dC8ytTgRerj4cOZ4FeJpsnMXzVkgcZidcXv3c1GRQgTBe', 'Dahiru', 'Ahmad', 'Nigeria', 'pending', 'B95ZWJR8', NULL, FALSE, '{"account_number":"6677011751","account_name":"Dahiru  Ahmad(Payrant)","bank_name":"Payrant","account_reference":"694aebecde74fefd3f967e83-mjiz73l8","provider":"payrant","status":"active"}'::jsonb, 'active', '2025-12-23T19:22:20.614Z', '2026-01-27T11:01:49.550Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-694d-6e9d-eeea-3fc22a3b87f8', 'zaheatgarki@gmail.com', '07040219940', '$2b$10$B8nVW.681wtth.Zjt2pfTO0QRMjSBKFCIkJY7Ki.cCPEGfD/usLd.', 'Zahairu ', 'Rabiu ', 'Nigeria', 'pending', '9KZN7PQT', NULL, FALSE, '{"account_number":"6617017183","account_name":"Zahairu  Rabiu(Payrant)","bank_name":"Payrant","account_reference":"694d6e9deeea3fc22a3b87f8-mjlp2fbn","provider":"payrant","status":"active"}'::jsonb, 'active', '2025-12-25T17:04:29.532Z', '2025-12-25T17:04:29.532Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6951-0fc5-eeea-3fc22a3b8fd1', 'musabsoftdrinks@gmail.com', '07034690799', '$2b$10$brQqgegSm2ZS3D5vje6lwO3mXW22KS8zZFG/YOj5ziiQqqCgA1kLe', 'Musa', 'Abubakar ', 'Nigeria', 'pending', 'C3F0L6FW', NULL, FALSE, '{"account_number":"6616432128","account_name":"Musa Abubakar(Payrant)","bank_name":"Payrant","account_reference":"69510fc5eeea3fc22a3b8fd1-mjpmr9to","provider":"payrant","status":"active"}'::jsonb, 'active', '2025-12-28T11:08:53.389Z', '2026-02-22T19:50:16.158Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6952-c4b3-de74-fefd3f9691cf', 'abubakarbaita2001@gmail.com', '09060267678', '$2b$10$ATl29o0O3BcjFPNVIExxVO4s1PjaxOJ1xg6o5yfFyukVmYTJScWK.', 'Abubakar ', 'Abdullahi', 'Nigeria', 'pending', 'Z6IO3ZB5', NULL, FALSE, '{"account_number":"6637334326","account_name":"Abubakar  Abdullahi(Payrant)","bank_name":"Payrant","account_reference":"6952c4b3de74fefd3f9691cf-mjrh8qzz","provider":"payrant","status":"active"}'::jsonb, 'active', '2025-12-29T18:13:07.813Z', '2025-12-29T18:13:07.813Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6953-d3b2-de74-fefd3f96944f', 'hamzasanigrk@gmail.com', '08164727733', '$2b$10$wROp/CwylBSg8NpsqZJ7JuKHYsAGnMtw6vEEHdCqE9UkdiIsNrT2C', 'HAMZA', 'Sani', 'Nigeria', 'pending', 'B0T5XQSW', NULL, FALSE, '{"account_number":"6696131173","account_name":"HAMZA Sani(Payrant)","bank_name":"Payrant","account_reference":"6953d3b2de74fefd3f96944f-mjsmji64","provider":"payrant","status":"active"}'::jsonb, 'active', '2025-12-30T13:29:22.591Z', '2026-01-11T14:23:02.239Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6954-417c-de74-fefd3f96961d', 'abdullahiisyakuglmw070@gmail.com', '07031548943', '$2b$10$ORncTXaVn0Vx5OxeKxEEHetHDiY.qKXp5PJ4LZsc9VIcfR2TyaVcG', 'Abdullahi', 'Isyaku', 'Nigeria', 'pending', '7HAQGU58', NULL, FALSE, '{"account_number":"6657404122","account_name":"Abdullahi Isyaku(Payrant)","bank_name":"Payrant","account_reference":"6954417cde74fefd3f96961d-mjt3czmq","provider":"payrant","status":"active"}'::jsonb, 'active', '2025-12-30T21:17:48.478Z', '2025-12-30T21:17:48.478Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6956-bf2f-6221-f213880fa475', 'saifullahikabiru38@gmail.com', '08137788622', '$2b$10$4WDDTXgkat793hfYTPBpXeXNtuGmzZCgEYIK4JW.HVpAtFDqXJr96', 'SAIFULLAHI ', 'KABIRU ', 'Nigeria', 'pending', 'PY0UQMW0', NULL, FALSE, '{"account_number":"6628806468","account_name":"SAIFULLAHI  KABIRU(Payrant)","bank_name":"Payrant","account_reference":"6956bf2f6221f213880fa475-mjvsgyya","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-01-01T18:38:39.886Z', '2026-01-01T18:38:39.886Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6958-f15d-6221-f213880faa25', 'abbabashari715@gmail.com', '08109503027', '$2b$10$pU3jkxVQ.SrfJ4MpmmUuJu5co9FvPRq6/h32iStqxN/ngq7tca3Tq', 'Abba ', 'Bashari ', 'Nigeria', 'pending', '50B9SZ08', NULL, FALSE, '{"account_number":"6623958293","account_name":"Abba  Bashari(Payrant)","bank_name":"Payrant","account_reference":"6958f15d6221f213880faa25-mjy65ioc","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-01-03T10:37:17.654Z', '2026-01-03T10:37:17.654Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6959-80b1-8b59-d9ec21030034', 'maihalinmalam08@gmail.com', '09068538450', '$2b$10$R5wVIH7GwqYnhx8pZBaqf.mowcGZ7k3JchivhCew.DoNtXPTFDKEK', 'ADAMU', 'Murtala Abbani', 'Nigeria', 'pending', '6DUZXQY4', NULL, FALSE, '{"account_number":"6682853723","account_name":"ADAMU Murtala Abbani(Payrant)","bank_name":"Payrant","account_reference":"695980b18b59d9ec21030034-mjys0yv2","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-01-03T20:48:49.259Z', '2026-01-03T20:48:49.259Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6959-9d05-6221-f213880fad49', 'yusifsulaimanysy@gmail.com', '07039702857', '$2b$10$dq/bNk8qUe7ckMyn9o3hP.oFaRd4u8TAuWhpfWNyiZ.W4y5T1ACRa', 'Yusif ', 'Sulaiman ', 'Nigeria', 'pending', 'PTX12JH4', NULL, FALSE, '{}'::jsonb, 'active', '2026-01-03T22:49:41.720Z', '2026-01-03T22:49:41.720Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-695a-4f7d-8b59-d9ec2103020a', 'abdulmalikabdulhadi18@gmail.com', '08138720403', '$2b$10$3TUs/P5gnGcaNUjl1haGq.uIwvU0PxNCzY48riTFbIYgdUULtjpP2', 'Abdulmalik', 'Abdulhadi', 'Nigeria', 'pending', '4L05XRC2', NULL, FALSE, '{"account_number":"6695873304","account_name":"Abdulmalik Abdulhadi(Payrant)","bank_name":"Payrant","account_reference":"695a4f7d8b59d9ec2103020a-mjznihd5","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-01-04T11:31:09.656Z', '2026-01-04T11:31:09.656Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-695a-6b8f-8b59-d9ec21030254', 'aliidikanyu@gmail.com', '08033557450', '$2b$10$mq3RGDNI6PhDcpJtZs5BreooGDE2Ie46nxH.QdLUMPZ4snB1Wd4Gy', 'Ali', 'Idris', 'Nigeria', 'pending', 'FWEXVV29', NULL, FALSE, '{"account_number":"6699484595","account_name":"Ali Idris(Payrant)","bank_name":"Payrant","account_reference":"695a6b8f8b59d9ec21030254-mjzrt486","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-01-04T13:30:55.693Z', '2026-07-09T21:12:27.577Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-695a-7977-8b59-d9ec21030301', 'abbayahayavirus2011@gmail.com', '08038292739', '$2b$10$3IMqnJAdsL9UWm9r9hCPzu.d4PVMHgx4GrKuVEcSPBPOMwgYDJm9m', 'Abba ', 'Yahaya', 'Nigeria', 'pending', 'M15LEJ4X', NULL, FALSE, '{"account_number":"6630894703","account_name":"Abba  Yahaya(Payrant)","bank_name":"Payrant","account_reference":"695a79778b59d9ec21030301-mjztx556","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-01-04T14:30:15.148Z', '2026-01-04T14:30:15.148Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-695a-7fe8-8b59-d9ec21030322', 'abdulazizabdullahi908@gmail.com', '08037687979', '$2b$10$qbD2L6oVQ/5gDcqgmPQi3e6O8GLgoTadQ3E3gTMfBx/mn9YOeTY82', 'Abdulaziz ', 'Abdullahi ', 'Nigeria', 'pending', 'K77Z2MM6', NULL, FALSE, '{"account_number":"6639882448","account_name":"Abdulaziz  Abdullahi(Payrant)","bank_name":"Payrant","account_reference":"695a7fe88b59d9ec21030322-mjzuwg7n","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-01-04T14:57:44.348Z', '2026-01-04T14:57:44.348Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-695a-8128-6221-f213880faf5d', 'musagumel9@gmail.com', '07042895491', '$2b$10$dF1Nfd45GclpN7wZ.e2piuR39UcOcwupwLUS.Z1kBfYytuuxlJpRm', 'Musa ', 'Saleh', 'Nigeria', 'pending', 'VAYSTIT7', NULL, FALSE, '{"account_number":"6632508138","account_name":"Musa  Saleh(Payrant)","bank_name":"Payrant","account_reference":"695a81286221f213880faf5d-mjzv2v1p","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-01-04T15:03:04.285Z', '2026-01-04T15:03:04.285Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-695a-8463-6221-f213880faf93', 'sadiqbashari45@gmail.com', '08139090986', '$2b$10$6tR/oKei9GcswDUJm.Kpx.winEhJPzwJ6jUM/wuh86CyWDmmttxoW', 'Sadiq ', 'Bravo', 'Nigeria', 'pending', 'OU9C4IVS', NULL, FALSE, '{"account_number":"6643600392","account_name":"Sadiq  Bravo(Payrant)","bank_name":"Payrant","account_reference":"695a84636221f213880faf93-mjzvksvh","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-01-04T15:16:51.457Z', '2026-01-04T15:16:51.457Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-695a-8521-8b59-d9ec21030369', 'usmanabubakardanmadai@gmail.com', '07062865754', '$2b$10$pZYkSbJtYH4LYt9Cin1N9O/bJyiGPNKAKyITyNAS6Vug14m8xkAPe', 'Usman', 'Abubakar', 'Nigeria', 'pending', 'J0PVS1KX', NULL, FALSE, '{"account_number":"6601960624","account_name":"Usman Abubakar(Payrant)","bank_name":"Payrant","account_reference":"695a85218b59d9ec21030369-mjzvp8az","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-01-04T15:20:01.263Z', '2026-01-04T15:20:01.263Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-695a-8dc6-8b59-d9ec210303cd', 'auwalukiyaya@gmail.com', '09035715458', '$2b$10$dqtDirywuPGQrnK5rq0Ov.eamSqSSycahb0uLBZB5a/q0qF4J9YRS', 'Auwal', 'Haruna', 'Nigeria', 'pending', 'PWOU90B4', NULL, FALSE, '{"account_number":"6653857890","account_name":"Auwal Haruna(Payrant)","bank_name":"Payrant","account_reference":"695a8dc68b59d9ec210303cd-mjzx0rqg","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-01-04T15:56:54.889Z', '2026-01-04T15:56:54.889Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-695a-9017-6221-f213880fb012', 'abbagarbagml@gmail.com', '09032945502', '$2b$10$nlJDxFTPkCVXwFmUZpRIvOqlYi2HhXEVDG0QCoeGupzkvK9ACUV0G', 'Abba', 'Garba', 'Nigeria', 'pending', '6OO9AVE2', NULL, FALSE, '{"account_number":"6624783358","account_name":"Abba Garba(Payrant)","bank_name":"Payrant","account_reference":"695a90176221f213880fb012-mjzxfy6h","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-01-04T16:06:47.638Z', '2026-01-04T16:06:47.638Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-695a-b29e-6221-f213880fb0dc', 'abubakarusmangml1379@gmail.com', '08080672845', '$2b$10$w2fLBFwkgDheO2Rg0cPcaem2Lq2igxAwmxNiouElVB.cGaEdBFKam', 'Abubakar', 'Usman ', 'Nigeria', 'pending', 'DLQY2CXZ', NULL, FALSE, '{"account_number":"6638996800","account_name":"Abubakar Usman(Payrant)","bank_name":"Payrant","account_reference":"695ab29e6221f213880fb0dc-mk02mj7c","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-01-04T18:34:06.801Z', '2026-01-04T18:34:06.801Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-695d-85fb-6221-f213880fbb43', 'adamusaminu518@gmail.com', '09063825018', '$2b$10$7VOrSxz9jK0Auzca9H7W4ur2NEf6Gyauvz1IH0aTu2OADZuzF0086', 'Adamu', 'Saminu', 'Nigeria', 'pending', 'VZEGX7R5', NULL, FALSE, '{"account_number":"6683120317","account_name":"Adamu  Saminu(Payrant)","bank_name":"Payrant","account_reference":"695d85fb6221f213880fbb43-mnh9x738","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-01-06T22:00:27.557Z', '2026-01-06T22:08:45.869Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6965-0176-6221-f213880fcf82', 'Nuragrk2006@gmail.com', '08066554932', '$2b$10$48lwMxlUtcL8HuCD3xoZ7uD7.9IqC929wTLedEKZX9RrLqn67bQQm', 'Nura', 'Muhammad Lawan ', 'Nigeria', 'pending', '2OU8N384', NULL, FALSE, '{}'::jsonb, 'active', '2026-01-12T14:13:10.541Z', '2026-01-12T14:13:10.541Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6966-7869-6221-f213880fd2b0', 'yawalebaba1@gmail.com', '08060824449', '$2b$10$t5HXNOzPtxr2RZumpu/oW.P0vabrtaS0Mg7pwQRjaLEH7Sbzt3gD2', 'Yawale ', 'Baba Ibrahim ', 'Nigeria', 'pending', '2TG277ZW', NULL, FALSE, '{"account_number":"6685322583","account_name":"Yawale  Baba Ibrahim(Payrant)","bank_name":"Payrant","account_reference":"696678696221f213880fd2b0-mkcuh162","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-01-13T16:52:57.485Z', '2026-01-13T16:52:57.485Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6967-6564-8b59-d9ec21032819', 'babangidasadik5@gmail.com', '07030260467', '$2b$10$W/tiXEnTXE94CGTqwdwbeOzurgi0sJ56VRIlyLGUAaHa/Fg6OXlSW', 'Abubakar', 'Babangida', 'Nigeria', 'pending', 'W692TDLF', NULL, FALSE, '{"account_number":"6697719316","account_name":"Abubakar Babangida(Payrant)","bank_name":"Payrant","account_reference":"696765648b59d9ec21032819-ml57dghl","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-01-14T09:44:04.011Z', '2026-02-02T13:22:37.004Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6967-9387-f32c-57d5530d77b9', 'mrabiu880@gmail.com', '07032963838', '$2b$10$mBZYRGNfRn8ayUTHvGOdU.kwUH04Y24osG7188ISEgdNdO8KJUiE.', 'Rabiu Musa ', 'Ramaz ', 'Nigeria', 'pending', 'AKA82OET', NULL, FALSE, '{}'::jsonb, 'active', '2026-01-14T13:00:55.682Z', '2026-01-14T13:00:55.682Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6967-97be-f32c-57d5530d7833', 'dahirualiyu435@gmail.com', '07037119417', '$2b$10$PUC9MTULabh9nDmiMRzr4u4yN3hCatbTOuGMb/tDyiolYxc5/c4ca', 'ALIYU', 'DAHIRU', 'Nigeria', 'pending', '2KSH0XFU', NULL, FALSE, '{"account_number":"6642684120","account_name":"ALIYU DAHIRU(Payrant)","bank_name":"Payrant","account_reference":"696797bef32c57d5530d7833-mke1tzew","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-01-14T13:18:54.262Z', '2026-01-14T13:18:54.262Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-696a-6089-e751-5e1550bdf8e8', 'prosperjasper002@gmail.com', '08088888888', '$2b$10$ONm5RBEsxl5UhxLpYsYsB.M3ILvshCiLU/vR1ZrY/QDB1D60dSqwa', 'Cfggh', 'Hgfgg', 'Nigeria', 'pending', 'OFIGBIWK', NULL, FALSE, '{}'::jsonb, 'active', '2026-01-16T16:00:09.378Z', '2026-01-16T16:00:09.378Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-696b-f26a-27eb-059addcfd74c', 'uteach3882@gmail.com', '09068369391', '$2b$10$vgx6yWkxs0yBay9M54EUR.k0m6VZ.vkCgeLgvCgn1lzcH1llriPk2', 'Usman', 'Umar', 'Nigeria', 'pending', 'FTSSNCHY', NULL, FALSE, '{"account_number":"6657488015","account_name":"Usman Umar(Payrant)","bank_name":"Payrant","account_reference":"696bf26a27eb059addcfd74c-mkv405wh","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-01-17T20:34:50.988Z', '2026-01-17T20:34:50.989Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6970-ef6d-27eb-059addcfe136', 'ibrahimhabibugrk@gmail.com', '07036380422', '$2b$10$qp69hPjL3KzQmarMfSPtE.IkG1M4ptozm5JW9R4goY11/2322B8OO', 'Ibrahim ', 'Habibu ', 'Nigeria', 'pending', 'HKBVGG80', NULL, FALSE, '{}'::jsonb, 'active', '2026-01-21T15:23:25.178Z', '2026-01-21T15:23:25.178Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6972-2d54-e751-5e1550be0b0f', 'isahaligrk1@gmail.com', '07025852613', '$2b$10$eFNPVbxiNza0UUKzEsS4ZuuunYp5HIHqpDYpN3IIGXTm/Fr1IlnBG', 'Isah ', 'Ali', 'Nigeria', 'pending', 'RELXALUY', NULL, FALSE, '{"account_number":"6678213147","account_name":"Isah  Ali(Payrant)","bank_name":"Payrant","account_reference":"69722d54e7515e1550be0b0f-mkpirz4t","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-01-22T13:59:48.791Z', '2026-01-22T13:59:48.791Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6974-d1b5-27eb-059addcfeb86', 'aliyuyushaushimali@gmail.com', '07073811105', '$2b$10$hwAOtDUatg2XK28aWUfy9eUMIXWdG3D342Np0bDdZtAQeVL71LoRK', ' Aliyu ', 'Yushau', 'Nigeria', 'pending', 'IQJWDQ9R', NULL, FALSE, '{}'::jsonb, 'active', '2026-01-24T14:05:41.949Z', '2026-01-24T14:05:41.949Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6975-9f7f-27eb-059addcfedbe', 'abbadanlele7@gmail.com', '09065583345', '$2b$10$AQQgBIGKjpub8AEwj0zALeR39sG8dPBRtEsD5THbH7n41jZlyf1lK', 'Isah', 'Lawan', 'Nigeria', 'pending', '1N0IWTEU', NULL, FALSE, '{}'::jsonb, 'active', '2026-01-25T04:43:43.762Z', '2026-01-25T04:43:43.762Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6978-bb39-e751-5e1550be1f46', 'aminukabiru7222@gmail.com', '07061587222', '$2b$10$0VrIl/0pi.X9oaQFhoDgDe10SzNKyGw8Bs1TA.iEcMm9fMkS3F37S', 'Aminu ', 'Kabiru ', 'Nigeria', 'pending', 'YWKKJSKX', NULL, FALSE, '{"account_number":"6648542803","account_name":"Aminu  Kabiru(Payrant)","bank_name":"Payrant","account_reference":"6978bb39e7515e1550be1f46-mkwmi51f","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-01-27T13:18:49.467Z', '2026-01-27T13:18:49.467Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-697c-cf49-e751-5e1550be283e', 'abdurrahmanyushaugrk@gmail.com', '7062858191', '$2b$10$/y4gol6liOkgQfrkWQy/z.C3BzpSkvmMjlHfjqXIrcdU5/N7loT92', 'ABDURRAHMAN ', 'YUSHA''U ', 'Nigeria', 'pending', 'RE7PXFYQ', NULL, FALSE, '{}'::jsonb, 'active', '2026-01-30T15:33:29.562Z', '2026-01-30T15:33:29.562Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-697c-d2d9-e751-5e1550be2852', 'khalidsulaiman0003@gmail.com', '08105239437', '$2b$10$2CpiWNU6MGIvyRQ4bC0ukOGw1irn4VNhbsfTJvTXMNUxjSXERbxQO', 'Khalid', 'Sulaiman', 'Nigeria', 'pending', 'WF16R91O', NULL, FALSE, '{}'::jsonb, 'active', '2026-01-30T15:48:41.768Z', '2026-01-30T15:48:41.768Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-697c-e02b-27eb-059addd0019f', 'usamatuyasir580@gmail.com', '08135902083', '$2b$10$iOfTsL/vuW3jE6uyEPi51OYmoCIO58tIKLBjpIZB7LDzzxcJ36HMm', 'Yasir', 'Usamatu', 'Nigeria', 'pending', 'POHIFKIR', NULL, FALSE, '{"account_number":"6675913480","account_name":"Yasir Usamatu(Payrant)","bank_name":"Payrant","account_reference":"697ce02b27eb059addd0019f-ml147au4","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-01-30T16:45:31.475Z', '2026-01-30T16:45:31.475Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-697c-e30e-e751-5e1550be28d1', 'tanimumustapha75@gmail.com', '07043426276', '$2b$10$Ios4h/zZP46P/mQ05AzeEe8V4p2LEj5.1eDBiAXLh69TyvBC6fd5.', 'Tanimu', 'Mustapha ', 'Nigeria', 'pending', 'YCVLXY05', NULL, FALSE, '{"account_number":"6644120208","account_name":"Tanimu Mustapha(Payrant)","bank_name":"Payrant","account_reference":"697ce30ee7515e1550be28d1-ml14pbzi","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-01-30T16:57:50.288Z', '2026-01-30T16:57:50.288Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-697c-ec59-27eb-059addd00219', 'lalesamaru@gmail.com', '09046233923', '$2b$10$LeJS4AuylkZLm2Jwy8VuY.j9xLZhX8es03PENuMt6C5dFXc.kUuCu', 'Aliyu ', 'Abdurrahman ', 'Nigeria', 'pending', '7EJ2CPLS', NULL, FALSE, '{}'::jsonb, 'active', '2026-01-30T17:37:29.916Z', '2026-01-30T17:37:29.916Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-697c-f015-27eb-059addd00269', 'testuser1@gmail.com', '08123456789', '$2b$10$TXIr7F1ppbM.DOMRUL4vOuyQNavlF4CmsAdLgFrH23w0el.9Oy3xW', 'Test', 'User', 'Nigeria', 'pending', '8GE7JOIJ', NULL, FALSE, '{}'::jsonb, 'active', '2026-01-30T17:53:25.986Z', '2026-01-31T07:36:24.517Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-697d-2dfa-e751-5e1550be2b78', 'ishaqauwalbj223@gmail.com', '8069943431', '$2b$10$vIDFKzNWTLY4kfSV3ezDpej5SNqNKGEF2FZ8nGpcr9JNzARckcHPK', 'Ishaq ', 'Muhammad Auwal ', 'Nigeria', 'pending', 'DIN96EJN', NULL, FALSE, '{}'::jsonb, 'active', '2026-01-30T22:17:30.763Z', '2026-01-30T22:17:30.763Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-697d-ecce-27eb-059addd0068e', 'Adamurabbilugarki@gmail.com', '08108424508', '$2b$10$MEjH6Brp1stxdGHt59klQeO5oYw5m71F2BaEqDrFr1W9iY6f2co1.', 'Adamu ', 'Rabbilu ', 'Nigeria', 'pending', '62IQU700', NULL, FALSE, '{}'::jsonb, 'active', '2026-01-31T11:51:42.656Z', '2026-01-31T11:51:42.656Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-697f-0bdb-e751-5e1550be3529', 'dahiramdah2700@gmail.com', '09136504110', '$2b$10$fjsz7GJt6GbPh6QVxqpMSO9mm9hzhBp6bEjFbgvjCCEFMnIhjwepG', 'Dahiru ', 'Munkaila ', 'Nigeria', 'pending', 'PWLO8DEW', NULL, FALSE, '{"account_number":"6648343020","account_name":"Dahiru  Munkaila(Payrant)","bank_name":"Payrant","account_reference":"697f0bdbe7515e1550be3529-mlexvxgq","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-01T08:16:27.767Z', '2026-02-01T08:16:27.767Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-697f-153e-e751-5e1550be354a', 'ayagrk001@gmail.com', '07073823720', '$2b$10$h71EYjfYeiCL3no6lFxYC.Ym2RXSMc0EgDdEj8c/HOxYTf25O95TG', 'Shaaibu', 'Auwalu', 'Nigeria', 'pending', 'ZIS6Z9BA', NULL, FALSE, '{"account_number":"6686079042","account_name":"Shaaibu Auwalu(Payrant)","bank_name":"Payrant","account_reference":"697f153ee7515e1550be354a-ml3icv7m","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-01T08:56:30.339Z', '2026-02-01T08:56:30.339Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-697f-87da-27eb-059addd01047', 'tonadeoludare213@gmail.com', '09046114146', '$2b$10$MgX2HuUMyh71Z606ESbDnenwz2RH/MwQ4Ib7M0zNtUVQkIWeEUVwC', 'John', 'Tonade', 'Nigeria', 'pending', 'Q72T68WD', NULL, FALSE, '{"account_number":"6673282223","account_name":"John Tonade(Payrant)","bank_name":"Payrant","account_reference":"697f87da27eb059addd01047-ml3zt8q2","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-01T17:05:30.520Z', '2026-02-01T17:05:30.520Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-697f-8b71-e751-5e1550be36f7', 'abubakaribrahimgrk2002@gmail.com', '07010685561', '$2b$10$hZMl9Zo6FavMRAKunaIneu8SM.Qv/D2B6Ws6lMfCAbILbSRAD4mxa', 'Abubakar', 'Ibrahim', 'Nigeria', 'pending', '370UVKN8', NULL, FALSE, '{"account_number":"6620523314","account_name":"Abubakar Ibrahim(Payrant)","bank_name":"Payrant","account_reference":"697f8b71e7515e1550be36f7-ml40db79","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-01T17:20:49.012Z', '2026-02-01T17:20:49.012Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-697f-9bc4-e751-5e1550be3754', 'aliyumukhtar1313@gmail.com', '07046546058', '$2b$10$ZAU4dlVIbh6P8dHBCIW2tusfhI9O8eE68k4PoNDCMW5IWzOB7CjSa', 'Aliyu', 'Mukhtar', 'Nigeria', 'pending', 'HQKVTQHF', NULL, FALSE, '{"account_number":"6677486539","account_name":"Aliyu Mukhtar(Payrant)","bank_name":"Payrant","account_reference":"697f9bc4e7515e1550be3754-ml42u31f","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-01T18:30:28.582Z', '2026-02-01T18:30:28.582Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-697f-a2e2-27eb-059addd010d1', 'auwaluhabugrk@gmail.com', '07040540869', '$2b$10$Uar1l.R5wiFUmWEWT0h55eGYVq.g/7pW.gI3F4k4R0zoK3ar7Gqjm', 'Auwalu ', 'Habu', 'Nigeria', 'pending', 'F44W2MOU', NULL, FALSE, '{"account_number":"6692820973","account_name":"Auwalu  Habu(Payrant)","bank_name":"Payrant","account_reference":"697fa2e227eb059addd010d1-ml43wzis","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-01T19:00:50.783Z', '2026-02-01T19:00:50.783Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6980-8f60-e751-5e1550be3a61', 'dadywadagrk@gmail.com', '09040319597', '$2b$10$5wwRUZGu2MdAVi9YIIAztuaKDtCNABtFdtm1t8bdR.P97iXQeemk.', 'Usman ', 'Wada Usman ', 'Nigeria', 'pending', '9CTBR9SZ', NULL, FALSE, '{"account_number":"6642165083","account_name":"Usman  Wada Usman(Payrant)","bank_name":"Payrant","account_reference":"69808f60e7515e1550be3a61-ml53yd8m","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-02T11:49:52.322Z', '2026-03-09T14:02:32.647Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6980-911d-e751-5e1550be3a73', 'zakiyyay106@gmail.com', '08107178193', '$2b$10$rO7ejX3Mm3/whtbSO82N4uw6EYDVG3Kca7nz0X62pwGIZQ.wMmioO', 'Zakiyya ', 'Yunusa ', 'Nigeria', 'pending', 'PSVR0AJL', NULL, FALSE, '{"account_number":"6610400892","account_name":"Zakiyya  Yunusa(Payrant)","bank_name":"Payrant","account_reference":"6980911de7515e1550be3a73-ml54lwpj","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-02T11:57:17.039Z', '2026-02-02T11:57:17.039Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6980-93a3-27eb-059addd01404', 'mubeelam@gmail.com', '08137336517', '$2b$10$.5pM31jKY6mRqTlgShnOWezF6n7qFTTtwM6XhSK9sI4a6n.v7OPPa', 'Mubeel ', 'Garki', 'Nigeria', 'pending', 'ICGFVQID', NULL, FALSE, '{}'::jsonb, 'active', '2026-02-02T12:08:03.233Z', '2026-02-02T12:08:03.233Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6980-9ff7-e751-5e1550be3ad9', 'kabiruhassangrk1332@gmail.com', '09132142625', '$2b$10$9TjssH8Ka6AqP2Ix6PRgROuLjj3.ik6EatIfY7oXYCHmUeyDYTfla', 'Kabiru', 'Hassan', 'Nigeria', 'pending', 'ZWNTULZ4', NULL, FALSE, '{"account_number":"6609987632","account_name":"Kabiru Hassan(Payrant)","bank_name":"Payrant","account_reference":"69809ff7e7515e1550be3ad9-ml56ln9b","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-02T13:00:39.767Z', '2026-02-06T18:11:19.589Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6980-cdf6-e751-5e1550be3bd9', 'yakubuisyaku62a@gmail.com', '07049735150', '$2b$10$Mow784UH5pVzhn99Rtn.auKdmBLj6DmJ10PDnPN5yveI/ET66iREq', 'Yakubu', 'Isyaku', 'Nigeria', 'pending', 'CY89M10R', NULL, FALSE, '{"account_number":"6606331774","account_name":"Yakubu Isyaku(Payrant)","bank_name":"Payrant","account_reference":"6980cdf6e7515e1550be3bd9-ml5di1bi","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-02T16:16:54.138Z', '2026-02-02T16:16:54.138Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6980-d093-27eb-059addd01566', 'muhammadsanialigarki@gmail.com', '07064760951', '$2b$10$3v22zJQjPTGxfGKEfKq2DeOHTs8mqD4EXDYXsvlnSoRtY9AlCg6oy', 'Muhammad ', 'Sani Ali', 'Nigeria', 'pending', 'ATVEVY01', NULL, FALSE, '{"account_number":"6625265614","account_name":"Muhammad  Sani Ali(Payrant)","bank_name":"Payrant","account_reference":"6980d09327eb059addd01566-ml5dwq3u","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-02T16:28:03.828Z', '2026-02-02T16:28:03.828Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6982-1842-e751-5e1550be40ff', 'magajiiliya2387@gmail.com', '07044201975', '$2b$10$8JZAd3z6HhRqTsyJM6DdD.Di2a3oFg6qgjD24.UQ5gCkUGNRNf1qG', 'MAGAJI', 'ILIYA', 'Nigeria', 'pending', '704D330J', NULL, FALSE, '{}'::jsonb, 'active', '2026-02-03T15:46:10.146Z', '2026-02-03T15:46:10.146Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6982-273c-e751-5e1550be416a', 'lawanjibril935@gmail.com', '08146822529', '$2b$10$k/ofQ3MdDRkMiYmY7tDW6uh3HRZjZzgHytBkNFtooj.igjg4UhHOy', 'Jibril', 'Lawan', 'Nigeria', 'pending', '4R2BCN7F', NULL, FALSE, '{"account_number":"6671140333","account_name":"Jibril Lawan(Payrant)","bank_name":"Payrant","account_reference":"6982273ce7515e1550be416a-ml6u4jyn","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-03T16:50:04.420Z', '2026-02-04T05:12:32.387Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6983-b4bc-e751-5e1550be465b', 'lawangana694@gmail.com', '08028129317', '$2b$10$A8fyCTbKPpebVf5uDNNODOqllvnZv0Ny9vq5lguewo34arJ2V4mQi', 'Lawan', 'Gana36', 'Nigeria', 'pending', 'Z5HGKOSZ', NULL, FALSE, '{"account_number":"6697245764","account_name":"Lawan  Gana36(Payrant)","bank_name":"Payrant","account_reference":"6983b4bce7515e1550be465b-ml8ipinz","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-04T21:06:04.650Z', '2026-04-22T09:05:45.557Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6983-ba1b-e751-5e1550be46a2', 'rabiukamal72@gmail.com', '09056302461', '$2b$10$9Zh4NcP6hjQS3lUFZyE.6O8CuGxv521uLwEogmy.R3aMGOfDBLnvq', 'Kamal', 'Rabiu', 'Nigeria', 'pending', 'Q3YMI3NZ', NULL, FALSE, '{"account_number":"6684996872","account_name":"Kamal Rabiu(Payrant)","bank_name":"Payrant","account_reference":"6983ba1be7515e1550be46a2-ml8jp06p","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-04T21:28:59.733Z', '2026-02-08T09:18:33.077Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6983-ba45-27eb-059addd02084', 'labagrk04@gmail.com', '09161992423', '$2b$10$lvtc/2YxCLK/VaN9blKPH.s95NsSunAeIXPJyR9bMeX0wEKjeAUSS', 'Mr.', 'Perfect ', 'Nigeria', 'pending', 'UHD93DO2', NULL, FALSE, '{"account_number":"6618877198","account_name":"Mr. Perfect(Payrant)","bank_name":"Payrant","account_reference":"6983ba4527eb059addd02084-ml8jmg2k","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-04T21:29:41.104Z', '2026-02-04T21:29:41.104Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6983-c516-e751-5e1550be4705', 'rahmasalisu550@gmail.com', '07075296111', '$2b$10$RWGTx5Cpho5FP7Rie4WrDerc6vk3yJ7ZeG9E8P4T1hsAwkIJ7LyFG', 'Aisha', 'Auwal', 'Nigeria', 'pending', 'DHSAYJRH', NULL, FALSE, '{"account_number":"6676610134","account_name":"Rahma  Salisu(Payrant)","bank_name":"Payrant","account_reference":"6983c516e7515e1550be4705-ml8l86lh","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-04T22:15:50.312Z', '2026-02-05T05:33:31.524Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6983-cf08-27eb-059addd0212a', 'bashirzulaihatu902@gmail.com', '07067740145', '$2b$10$uVbm/fBn6tpAiW7YiMDTZ.F9cxwYFxh7DwuPo7C0YI2UbHzLujPsu', 'Bashir ', 'Zulaihatu ', 'Nigeria', 'pending', 'JNZVPV6Z', NULL, FALSE, '{"account_number":"6678059251","account_name":"Bashir  Zulaihatu(Payrant)","bank_name":"Payrant","account_reference":"6983cf0827eb059addd0212a-ml8mu5k6","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-04T22:58:16.715Z', '2026-02-04T22:58:16.715Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6983-d01f-e751-5e1550be47a1', 'habubakartasiuhabubakartasiu@gmail.com', '09123273410', '$2b$10$KZjCZ6JgDz.CbvkL6wgZ2.dmlwA00k6wSIfAgkZRt4ckA6btH9FuK', 'Habubakartasiu12 ', 'Habubakartasiu12 ', 'Nigeria', 'pending', 'KDHJ19CO', NULL, FALSE, '{}'::jsonb, 'active', '2026-02-04T23:02:55.494Z', '2026-02-04T23:02:55.494Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6984-332d-27eb-059addd022f3', 'ismailaminu996@gmail.com', '08028888866', '$2b$10$e2ZuPf./QZ7.rxCB7ZaSNefIILkN.2c7pDxyfOD1bWoaFHhCMt8Ry', 'Aminu ', 'ismail', 'Nigeria', 'pending', 'SDZY785L', NULL, FALSE, '{}'::jsonb, 'active', '2026-02-05T06:05:33.357Z', '2026-02-05T06:05:33.357Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6984-61e5-27eb-059addd02342', 'umarbubakar56@gmail.com', '09063189857', '$2b$10$OLvl0jawYCEk3OTip2A/CevIUQ6gtBAt.DVNSEFudgPN/w44hWHyO', 'Umar ', 'Abubakar ', 'Nigeria', 'pending', 'PFYVEK92', NULL, FALSE, '{"account_number":"6679874854","account_name":"Umar  Abubakar(Payrant)","bank_name":"Payrant","account_reference":"698461e527eb059addd02342-ml99631f","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-05T09:24:53.153Z', '2026-02-05T09:24:53.153Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6984-6e11-e751-5e1550be49e6', 'ahmadkhalifausman@gmail.com', '09021966495', '$2b$10$OOT6kpn7LkUcK37oVxcWBuP1XVS0Rl7HodKWiv7goaF03LUB63Kqq', 'Usman ', 'Ahmad Khalifa ', 'Nigeria', 'pending', 'N48SFGZB', NULL, FALSE, '{}'::jsonb, 'active', '2026-02-05T10:16:49.079Z', '2026-02-05T10:16:49.079Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6984-8620-e751-5e1550be4a76', 'www.surajaabubaka@gmail.com', '08060364950', '$2b$10$NfvG/9BocDrMUeTnl/qSIOL3zoAquEnul5j.p.fbqrZeY1R3DUIx.', 'Suraja ', 'Abubakar ', 'Nigeria', 'pending', 'DHPT50BS', NULL, FALSE, '{"account_number":"6617674830","account_name":"Suraja  Abubakar(Payrant)","bank_name":"Payrant","account_reference":"69848620e7515e1550be4a76-ml9em6re","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-05T11:59:28.633Z', '2026-02-05T11:59:28.633Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6984-86a4-e751-5e1550be4a92', 'zalihaabubakarmohammed@gmail.com', '09169408396', '$2b$10$xjMmnTF19.h.tnAbIjAwv.AywWD407Wv5Nd5AaycisIS2GnBdS6Vm', 'Zaliha ', 'Abubakar Mohammed ', 'Nigeria', 'pending', '1Y3CJPNC', NULL, FALSE, '{"account_number":"6601891787","account_name":"Zaliha  Abubakar Mohammed(Payrant)","bank_name":"Payrant","account_reference":"698486a4e7515e1550be4a92-ml9epsam","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-05T12:01:40.990Z', '2026-02-05T12:01:40.990Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6984-8b80-27eb-059addd024f2', 'abdullahiusainigarki@gmail.com', '07067749972', '$2b$10$dOGQV/l5CpnhWXkGsFASYerI//PxnZLJLfIfo8V9bx4ScqmvVyN5e', 'Abdullahi ', 'Usaini', 'Nigeria', 'pending', 'IRKP4906', NULL, FALSE, '{"account_number":"6661647261","account_name":"Abdullahi  Usaini(Payrant)","bank_name":"Payrant","account_reference":"69848b8027eb059addd024f2-ml9ffwst","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-05T12:22:24.542Z', '2026-02-05T12:22:24.542Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6984-9ad7-e751-5e1550be4b07', 'fiddausiabubakar727@gmail.com', '09038376343', '$2b$10$0iBw7HB3EzME2fEZwlt0I.5pWejJ/C.4tEt1AvLtvUzCyw8O1oCFm', 'Fiddausi ', 'Abubakar ', 'Nigeria', 'pending', '18ZC7W67', NULL, FALSE, '{}'::jsonb, 'active', '2026-02-05T13:27:51.927Z', '2026-02-05T13:27:51.927Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6984-ab78-e751-5e1550be4ba0', 'umarbuhariubg@gmail.com', '08145981669', '$2b$10$G9nD/h3tDNFQEa7dH.DsbOpURi.sieK9wcJFlF50V75RvLQ5r528m', 'Umar', 'Buhari ', 'Nigeria', 'pending', 'PH4OM25Q', NULL, FALSE, '{}'::jsonb, 'active', '2026-02-05T14:38:48.066Z', '2026-02-05T14:38:48.066Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6984-abac-27eb-059addd025c7', 'surajayusuf509@gmail.com', '07039626057', '$2b$10$RG1zme0zO70QMEEfo4bM7ux9ROMlJkIieRAJYfmTJR0cWyFJa13oy', 'Yusuf', 'Suraja', 'Nigeria', 'pending', 'QKFOHKTV', NULL, FALSE, '{"account_number":"6673856137","account_name":"Yusuf Suraja(Payrant)","bank_name":"Payrant","account_reference":"6984abac27eb059addd025c7-ml9kjv3f","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-05T14:39:40.431Z', '2026-02-05T14:39:40.431Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6984-b1f3-e751-5e1550be4bd5', 'exlinjoy@gmail.com', '07011547048', '$2b$10$a/VDBN4EmsKfP.UPSnQbde/YzxtsfbNrvI1NBfbw4BFzVpS9LxOYS', 'Friday', 'Promise', 'Nigeria', 'pending', 'SG0PXKW8', NULL, FALSE, '{"account_number":"6691854352","account_name":"Friday  Promise(Payrant)","bank_name":"Payrant","account_reference":"6984b1f3e7515e1550be4bd5-ml9ledai","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-05T15:06:27.846Z', '2026-02-05T15:24:50.185Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6986-031e-e751-5e1550be52b5', 'idrisismaila1615@gmail.com', '08104738242', '$2b$10$MmI3SsJ2Ic/ohq6dXxrbaul0hVfydl6TtA2bW4l0uYB06sREDe37m', 'Idris ', 'Ismaila ', 'Nigeria', 'pending', '2MK95WDU', NULL, FALSE, '{}'::jsonb, 'active', '2026-02-06T15:05:02.610Z', '2026-02-06T15:05:02.610Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6986-44ec-27eb-059addd02da8', 'Hafizumustafa1@gmail.com', '08066579583', '$2b$10$CksklHBP1kb3HMaUeZE/0OVBPzLFwF9fbALTZ.9PMJQ5dATSKxKhO', 'HAFIZU', 'Musa ', 'Nigeria', 'pending', 'RWUYN7A4', NULL, FALSE, '{}'::jsonb, 'active', '2026-02-06T19:45:48.921Z', '2026-02-06T19:45:48.921Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6986-4d0c-27eb-059addd02def', 'baraatushehualiyu90@gmail.com', '07067448876', '$2b$10$7yu2Wo.VRgF6V8f2y1As8ueIjE1LTEux5BKCLKgOesoCJSqsg9qYC', 'maman sadiq', 'sadiq', 'Nigeria', 'pending', '72N5GCQ2', NULL, FALSE, '{"account_number":"6613079183","account_name":"maman sadiq sadiq(Payrant)","bank_name":"Payrant","account_reference":"69864d0c27eb059addd02def-mlbdb6hh","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-06T20:20:28.404Z', '2026-02-06T20:20:28.404Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6986-e336-e751-5e1550be5715', 'karibullahmansur615@gmail.com', '08062680736', '$2b$10$oLKxHgJOoG6MeXIlE.3D7OPgP2d5IfRS3dsiXKb/Mhtdrb9QHNjjm', 'KARIBULLAHI', 'MANSUR', 'Nigeria', 'pending', '88KJQI80', NULL, FALSE, '{"account_number":"6657881006","account_name":"KARIBULLAHI  MANSUR(Payrant)","bank_name":"Payrant","account_reference":"6986e336e7515e1550be5715-mlbyueoa","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-07T07:01:10.893Z', '2026-02-07T07:02:45.950Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6987-0654-27eb-059addd031ea', 'nafsaif900@gmail.com', '08060766090', '$2b$10$JFAV0koaumnSFW56OCQQE.dUNuSEgryB4mfnbAfmFIzob.EIiEJ/q', 'saifullahi', 'mujittapha', 'Nigeria', 'pending', 'XPX6UJ7K', NULL, FALSE, '{"account_number":"6699160496","account_name":"saifullahi mujittapha(Payrant)","bank_name":"Payrant","account_reference":"6987065427eb059addd031ea-mlc49m7y","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-07T09:31:00.556Z', '2026-02-07T09:43:10.442Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6987-0fd2-e751-5e1550be5908', 'Malhassan2004a@gmail.com', '09166704027', '$2b$10$B.C2jLrnkcQM9X3MT57cNOEhB574.KtcOoW/DKvRKYRxiJdRW/EWq', 'Alhassan', 'Musa', 'Nigeria', 'pending', '0868DKPF', NULL, FALSE, '{}'::jsonb, 'active', '2026-02-07T10:11:30.647Z', '2026-02-07T10:11:30.647Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6988-4314-27eb-059addd0375f', 'abdullahiauwal514@yahoo.com', '08064528491', '$2b$10$9IADdJxBwT0glK7IdxM55eKmSI3TP4HHKWORpTirSkgvrhIfqYfVS', 'Abdullahi', 'Auwal', 'Nigeria', 'pending', 'IUBL72KE', NULL, FALSE, '{"account_number":"6611967672","account_name":"Abdullahi  Auwal(Payrant)","bank_name":"Payrant","account_reference":"6988431427eb059addd0375f-mldgn2m3","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-08T08:02:28.144Z', '2026-02-08T08:05:29.881Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6988-79e3-27eb-059addd03922', 'rolandgoodness707@gmail.com', '08032323232', '$2b$10$JDzzK6FwgNcqKaPbBQfksO.heZsOUauMfUP3oGne1jkyHt1k9vJTK', 'Gambari ', 'Abdurasheed ', 'Nigeria', 'pending', 'IBA1Y3G6', NULL, FALSE, '{"account_number":"6697937366","account_name":"Gambari  Abdurasheed(Payrant)","bank_name":"Payrant","account_reference":"698879e327eb059addd03922-mldp10op","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-08T11:56:19.356Z', '2026-02-08T11:56:19.356Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6989-d5fc-30d8-238dc98ae6a5', 'danhajiya027@gmail.com', '08060475253', '$2b$10$RrWAVz.7AwJewmP.OqCelexJTSa7nCKCIYlKsZJkrduXbIyf6qGh2', 'Saraky', 'Auwal', 'Nigeria', 'pending', '1Q35T6Q0', NULL, FALSE, '{}'::jsonb, 'active', '2026-02-09T12:41:32.770Z', '2026-02-09T12:41:32.770Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6989-fd73-494b-caf1612607b1', 'garkigarki958@gmail.com', '9166675569', '$2b$10$Yz.A8eCgS77lV3Hba7USK.6Vq2rX68m4hmJc5j3S7bq1tmXng1IhO', 'Ibrahim ', 'Ib', 'Nigeria', 'pending', 'ODEW88P8', NULL, FALSE, '{}'::jsonb, 'active', '2026-02-09T15:29:55.712Z', '2026-02-09T15:29:55.712Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-698a-041b-19f2-0ddc42aae2fa', 'yusufabubakargarba07@gmail.com', '08163384578', '$2b$10$QkwtNnm92redqkrvfswedOqhFGIm9vtE2vXXRg5Z1wpsq6Tp9ttZ6', 'yusuf', 'abubakar garba', 'Nigeria', 'pending', 'JVT1JFCZ', NULL, FALSE, '{}'::jsonb, 'active', '2026-02-09T15:58:19.970Z', '2026-02-09T15:58:19.970Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-698a-e80e-494b-caf161260cdf', 'surajosumayya7@gmail.com', '08145894705', '$2b$10$25kjdlDPBfLXIP6CK1TrAekZ.2AWnQSdV91xuNfS2e2bGicavhj46', 'Sumayya', 'surajo', 'Nigeria', 'pending', 'AL3L1EBK', NULL, FALSE, '{"account_number":"6690210336","account_name":"Sumayya surajo(Payrant)","bank_name":"Payrant","account_reference":"698ae80e494bcaf161260cdf-mlgbnx2t","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-10T08:10:54.900Z', '2026-02-10T08:10:54.901Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-698a-eaf0-494b-caf161260d13', 'auwaluabdullahi0765@gmail.com', '07026507777', '$2b$10$x1I2DEoXVZct1PGvpLM5Q.KYYWS.nrD/wvSvJKzYD40uJIVhXZv4.', 'Auwalu ', 'Abdullahi ', 'Nigeria', 'pending', 'OWGCGIK3', NULL, FALSE, '{"account_number":"6641342352","account_name":"Auwalu  Abdullahi(Payrant)","bank_name":"Payrant","account_reference":"698aeaf0494bcaf161260d13-mlgc3fm4","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-10T08:23:12.222Z', '2026-02-10T08:23:12.222Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-698a-f0a2-19f2-0ddc42aae7b6', 'ibrahimabdullahikawugarki@gmail.com', '07080808801', '$2b$10$JDDyApOPU8kkCtDMmBzxrOJ/vKYlao29Pt/7lxYCJ9LcrJTWSCtka', 'Ibrahim ', 'Abdullahi ', 'Nigeria', 'pending', '5H6LJUHD', NULL, FALSE, '{"account_number":"6614032315","account_name":"Ibrahim  Abdullahi(Payrant)","bank_name":"Payrant","account_reference":"698af0a219f20ddc42aae7b6-mlgd0uto","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-10T08:47:30.578Z', '2026-02-10T08:47:30.578Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-698a-f57a-494b-caf161260db8', 'shamsinagarki68@gamil.com', '07068781815', '$2b$10$8xVnYwNiUHGOdSzd4KWnH.JNyFBnSA48y2riBxq7N96CgKjqolgAy', 'Shamsiddin', 'Abdulmudallif', 'Nigeria', 'pending', 'AP7G9BVU', NULL, FALSE, '{"account_number":"6620431492","account_name":"Shamsiddin Abdulmudallif(Payrant)","bank_name":"Payrant","account_reference":"698af57a494bcaf161260db8-mlgdp93o","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-10T09:08:10.107Z', '2026-02-10T09:08:10.107Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-698b-072e-19f2-0ddc42aae8d9', 'rukayyausman012@gmail.com', '09131258833', '$2b$10$BVEfB4ikEX25sbMRp7IgRelYy.s4KxFd7RzF8zQ0DICMcHWWLSBgS', 'Usman', 'Rukayya', 'Nigeria', 'pending', 'GGE2NBSA', NULL, FALSE, '{}'::jsonb, 'active', '2026-02-10T10:23:42.523Z', '2026-02-10T10:23:42.523Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-698b-0e6e-494b-caf161260e92', 'dahiruhassan3180@gmail.com', '07037883803', '$2b$10$htkAzjn.kUCuG5KwYufX8uI3A26.QsHDOvJPgmHbtGNo.ZPCmqtJm', 'DAHIRU', 'HASSAN', 'Nigeria', 'pending', '6H6BICGY', NULL, FALSE, '{}'::jsonb, 'active', '2026-02-10T10:54:38.600Z', '2026-02-10T10:54:38.600Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-698b-0ee4-494b-caf161260ea3', 'alhajijarkataura05@gmail.com', '07030631885', '$2b$10$Wsuwk3aR/LrG6bVul3my7.HPycZVAByG9Dh8LrFfw5G69BCjL6qeq', 'Musbahu', 'Ubale', 'Nigeria', 'pending', 'F1EY1YNQ', NULL, FALSE, '{"account_number":"6683947752","account_name":"Musbahu  Ubale(Payrant)","bank_name":"Payrant","account_reference":"698b0ee4494bcaf161260ea3-mlghl3tz","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-10T10:56:36.244Z', '2026-02-14T20:12:57.383Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-698b-1358-19f2-0ddc42aae92e', 'habibuyusuf558@gmail.com', '08136207317', '$2b$10$wLKrTyqhP6OsdX3STUtIj.FhLWR8nhSQqNKdVqH7ESw4E5UIHJXuK', 'Yusuf', 'Habibu', 'Nigeria', 'pending', 'EOZDJSHZ', NULL, FALSE, '{"account_number":"6656680228","account_name":"Yusuf Habibu(Payrant)","bank_name":"Payrant","account_reference":"698b135819f20ddc42aae92e-mlgi9mb1","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-10T11:15:36.920Z', '2026-02-10T11:15:36.920Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-698b-1694-494b-caf161260ee8', 'sulaimanisyakutaura@gmail.com', '07032072889', '$2b$10$Ma1bLSFn3A2WI878Zzu.pO78LpAvwLvXUcqzB3cEpxxt/1y1AWJrW', 'Suleman ', 'Isyaku ', 'Nigeria', 'pending', '05JZU6JT', NULL, FALSE, '{"account_number":"6618866366","account_name":"Suleman  Isyaku(Payrant)","bank_name":"Payrant","account_reference":"698b1694494bcaf161260ee8-mlgirflk","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-10T11:29:24.271Z', '2026-02-10T11:29:24.271Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-698b-187f-494b-caf161260ef8', 'suelcotan@gmail.com', '09420349422', '$2b$10$n.yvv.yiEwQpFO8FHwshQeObSdslL0qhJW4C8dpc433cTgb1rvlIe', 'Abba ', 'Suelco ', 'Nigeria', 'pending', 'DBI0V1VP', NULL, FALSE, '{}'::jsonb, 'active', '2026-02-10T11:37:35.097Z', '2026-02-10T11:37:35.097Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-698b-212f-494b-caf161260f53', 'musaibrahimmalumfashi@gmail.com', '08037642488', '$2b$10$m9UjgC1U0dQjR01Kj9uLOe4WK5scQ9Q0aSEzDJpOloNNTjCVQMWny', 'MUSA', 'IBRAHIM', 'Nigeria', 'pending', 'C3FGVGYP', NULL, FALSE, '{"account_number":"6618805806","account_name":"MUSA IBRAHIM(Payrant)","bank_name":"Payrant","account_reference":"698b212f494bcaf161260f53-mlgkdnwg","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-10T12:14:39.812Z', '2026-02-10T12:14:39.812Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-698b-25ec-19f2-0ddc42aae9f8', 'aderemiayomide193@gmail.com', '07085303850', '$2b$10$kIwSusytlCBMeKoNCWV.wOPk02uCfMwJmdi7pm64lVBJhRbEO4WRW', 'Ayomide ', 'Aderemi', 'Nigeria', 'pending', '6XZ24BI8', NULL, FALSE, '{"account_number":"6630124654","account_name":"Ayomide  Aderemi(Payrant)","bank_name":"Payrant","account_reference":"698b25ec19f20ddc42aae9f8-mlgl6xuz","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-10T12:34:52.686Z', '2026-02-10T12:34:52.686Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-698b-323d-494b-caf1612610d8', 'usmanaminuali194@gmail.com', '08168504375', '$2b$10$U13Qk0lupCi6si1/aUcUie5P02yCAJzQgHChuDS6PH.2dTEs9o8Yy', 'Usman ', 'Aminu ', 'Nigeria', 'pending', 'MS2JKWJU', NULL, FALSE, '{}'::jsonb, 'active', '2026-02-10T13:27:25.815Z', '2026-02-10T13:27:25.815Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-698b-3417-494b-caf1612610f9', 'hassanmagajibichi@gmail.com', '08109611542', '$2b$10$P9lNGzAlezedDU.HluY6M.MjWXsEuxsLapyLQsZSk/7PukEOraXQ6', 'HASSAN ', 'MAGAJI', 'Nigeria', 'pending', '7N9UWI2L', NULL, FALSE, '{"account_number":"6662614876","account_name":"HASSAN  MAGAJI(Payrant)","bank_name":"Payrant","account_reference":"REF-1770730634067","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-10T13:35:19.072Z', '2026-02-10T13:35:19.072Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-698b-37c0-19f2-0ddc42aaeaf7', 'hustleridris@gmail.com', '09065136153', '$2b$10$7zh7Rf/FkaoD3ELt8gXLsewiU01o8IHcOUvm8qUghZIfUjmOZ..86', 'Idris', 'Abdussalam', 'Nigeria', 'pending', 'DS61B8ZQ', NULL, FALSE, '{"account_number":"6693583891","account_name":"Idris Abdussalam(Payrant)","bank_name":"Payrant","account_reference":"REF-1770731586005","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-10T13:50:56.191Z', '2026-02-10T13:50:56.191Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-698b-3c4f-494b-caf16126114d', 'shamsihassan175@gmail.com', '07069203391', '$2b$10$UT/6Es0WSIYtEdsu4MC5vOHYTscrRUcTYn2zOEzxnO9W8FWPaotKG', 'Shamsi', 'Hassan ', 'Nigeria', 'pending', 'HG5PDMYC', NULL, FALSE, '{"account_number":"6666669372","account_name":"Shamsi Hassan(Payrant)","bank_name":"Payrant","account_reference":"REF-1770732708134","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-10T14:10:23.266Z', '2026-02-12T13:42:20.370Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-698b-3dd9-19f2-0ddc42aaeb34', 'salesunusurng1@gmail.com', '07069210811', '$2b$10$O9sUoQgA7ijpW7HDI1XR..CrLu.uj3Cdlc/ucFzWZeZO/GwWnswXa', 'Sale', 'Sunusi', 'Nigeria', 'pending', 'ZNDI7JOS', NULL, FALSE, '{"account_number":"6672901195","account_name":"Sale Sunusi(Payrant)","bank_name":"Payrant","account_reference":"REF-1770733032866","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-10T14:16:57.294Z', '2026-02-10T14:16:57.294Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-698b-75da-19f2-0ddc42aaebe7', 'nm370303@gmail.com', '08129727179', '$2b$10$aNXJ9GxMuSVZHhl6V2NxFeMd7qOazcbsNq6Fgetcajh74BfFzBCge', 'Nafisat ', 'Muhammad ', 'Nigeria', 'pending', '7Q0CO6IT', NULL, FALSE, '{}'::jsonb, 'active', '2026-02-10T18:15:54.685Z', '2026-02-10T18:15:54.685Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-698c-46f7-19f2-0ddc42aaef71', 'mukhtarsani256@gmail.com', '09061933127', '$2b$10$Q5UGH8XZDzPDQvg8OnBz9.1Nyt0JUk92jF5ktipzAaFioge.qjoSe', 'Scientist', 'Jr', 'Nigeria', 'pending', '8BLOX4U5', NULL, FALSE, '{}'::jsonb, 'active', '2026-02-11T09:08:07.345Z', '2026-02-11T09:08:07.345Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-698c-68c2-494b-caf16126164a', 'aishausman796967@gmail.com', '09125934439', '$2b$10$ptP4zoLtqLNyMjD/3aelCOWIDUr1E.Dhy34.EmC6.TN2qf9rZNAf.', 'Aisha Usman ', 'Abubakar ', 'Nigeria', 'pending', 'JK9O0AQ4', NULL, FALSE, '{}'::jsonb, 'active', '2026-02-11T11:32:18.968Z', '2026-02-11T11:32:18.968Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-698c-a53e-494b-caf161261816', 'uwaisuishaqa3@gmail.com', '07078886109', '$2b$10$gHQWFgkE7K2p7tjkiKqtm.C6AbuSliMczeKwXZahK9eUkrgrmZrDW', 'Uwaisu', 'Ishaqa', 'Nigeria', 'pending', '5IQ37NQ9', NULL, FALSE, '{}'::jsonb, 'active', '2026-02-11T15:50:22.346Z', '2026-02-11T15:50:22.346Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-698c-f4d6-19f2-0ddc42aaf477', 'hatimiabubakar@gmail.com', '09012388301', '$2b$10$R8vxFTxGPtAfpMO2xNYpqOz5yNJw1TAd0jSl65lArAQ22Th3G18F6', 'KHALEEPHA ', ' MANGAL ', 'Nigeria', 'pending', 'S6ZGTRXZ', NULL, FALSE, '{}'::jsonb, 'active', '2026-02-11T21:29:58.412Z', '2026-02-11T21:29:58.412Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-698d-9d99-19f2-0ddc42aaf672', 'alimahamadu932@gmail.com', '09033184280', '$2b$10$TxyEUlwbBl54yKWKmhPEMO2VBch.1xmxA.ws9gyFOBQbTDLndFKwe', 'Mhmd ', 'Ali ', 'Nigeria', 'pending', '4SULOW05', NULL, FALSE, '{}'::jsonb, 'active', '2026-02-12T09:30:01.763Z', '2026-02-12T09:30:01.763Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-698e-d892-494b-caf1612621bd', 'abdulmalikb344@gmail.com', '08142844446', '$2b$10$zqX8of2cXI5KZe.AmtEXO.bJdd60qVBl.bAd9opZ5GFz53ECOzVtW', 'A Malik', 'Bello', 'Nigeria', 'pending', 'T4VKDV7R', NULL, FALSE, '{}'::jsonb, 'active', '2026-02-13T07:53:54.589Z', '2026-02-13T07:53:54.589Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6990-462c-494b-caf1612627e2', 'adamfarida331@gmail.com', '08142613190', '$2b$10$ZiBGs0pFDZkrPDBy4K9Z3OVs4efMB.Xwq.rtE/PlrnWAAdxTK2zf.', 'Farida ', 'Adam', 'Nigeria', 'pending', '83DBL4Q6', NULL, FALSE, '{}'::jsonb, 'active', '2026-02-14T09:53:48.706Z', '2026-02-14T09:53:48.706Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6990-bb84-19f2-0ddc42ab0266', 'swallern@gmail.com', '07070249434', '$2b$10$uHAss9Ctol4xoHa72yZyDObtjXR9vxSwyvtOcblzej/pqX4eFCiOK', 'Abubakar Umar ', 'Faruk ', 'Nigeria', 'pending', 'RZ86LHKE', NULL, FALSE, '{"account_number":"6659809787","account_name":"Abubakar Umar  Faruk(Payrant)","bank_name":"Payrant","account_reference":"REF-1771093023030","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-14T18:14:28.157Z', '2026-02-14T18:14:28.157Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6990-c5fe-19f2-0ddc42ab030a', 'ibrahimmshehu32@gmail.com', '09161406932', '$2b$10$fI699E5yoWYpgEqTbbUxJew/hGhbfKUKDKYYRmKqFS4igWH/dJ0Um', 'Ibrahim MS ', 'Shehu', 'Nigeria', 'pending', '43117O4J', NULL, FALSE, '{}'::jsonb, 'active', '2026-02-14T18:59:10.657Z', '2026-02-14T18:59:10.657Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6994-083e-19f2-0ddc42ab0efb', 'abdulmalikhabibu1234@gmail.com', '07048993717', '$2b$10$9BccpEDVhHbh74ttw.6H2uAIG2gjI32j6aBTLdoMN0OEZdsXhcNCK', 'ABDULMALIK', 'HABIBU', 'Nigeria', 'pending', 'CM55M3BV', '00000000-691c-8e9c-0905-272b76d063c7', FALSE, '{"account_number":"6693699311","account_name":"ABDULMALIK HABIBU(Payrant)","bank_name":"Payrant","account_reference":"REF-1771309139463","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-17T06:18:38.062Z', '2026-02-17T06:18:38.062Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6995-4595-19f2-0ddc42ab144c', 'hlawanteem@gmail.com', '08030949194', '$2b$10$/leUbIumRz13dHgpoLSDVeq1A9NVUmaOgHpKk4aAgTRCIn72O61lS', 'Husaini', 'Lawan', 'Nigeria', 'pending', 'V61KFUDB', NULL, FALSE, '{}'::jsonb, 'active', '2026-02-18T04:52:37.740Z', '2026-02-18T04:52:37.740Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6995-c1a6-494b-caf161263c9b', 'ahmadhussain554@gmail.com', '9122476894', '$2b$10$HnuYXabZM1p8XmEuhwrmaOJaRNSzqPQ.aCEgLYEMa8zCdXhQ0Pu2m', 'Ahmad ', 'Abdullahi ', 'Nigeria', 'pending', 'DBZW9C61', NULL, FALSE, '{}'::jsonb, 'active', '2026-02-18T13:41:58.726Z', '2026-02-18T13:41:58.726Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6995-c806-494b-caf161263cbb', 'salisuabdurrahman332@gmail.com', '09161890402', '$2b$10$5nv7QlNjGFTi4JoOxRVh3uX2Zdx.RyMdKpXBmo9mPWBHzRhSpcF9i', 'Dr ', 'Salihi', 'Nigeria', 'pending', 'YUHOQRKR', NULL, FALSE, '{"account_number":"6637566608","account_name":"Dr  Salihi(Payrant)","bank_name":"Payrant","account_reference":"REF-1771840763691","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-18T14:09:10.978Z', '2026-02-18T14:09:10.978Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6998-ba4d-19f2-0ddc42ab1fd4', 'aliyumuhammad949@gmail.com', '08032495509', '$2b$10$y0oCWYQ84lBUA1iazKyPhOCwaqmFOvYrpiEcVyk5EwZdaI.VFwT0.', 'Ali ', 'Muhammad ', 'Nigeria', 'pending', '2YHUV0OS', NULL, FALSE, '{"account_number":"6697343543","account_name":"Ali  Muhammad(Payrant)","bank_name":"Payrant","account_reference":"REF-1771616918533","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-20T19:47:25.126Z', '2026-02-20T19:47:25.126Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6999-748d-19f2-0ddc42ab2220', 'mugupet868@gmail.com', '07063012438', '$2b$10$9Xyc.Bdd.KEVkld9WUbzSOyedpYQT3kt1e5sjJ6AkkxOUxU2xGs0.', 'Adebayo', 'Bakare', 'Nigeria', 'pending', 'IH2UL2FF', NULL, FALSE, '{"account_number":"6664516023","account_name":"Adebayo Bakare(Payrant)","bank_name":"Payrant","account_reference":"REF-1771664611606","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-21T09:02:05.216Z', '2026-02-21T09:06:58.117Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6999-e327-19f2-0ddc42ab2689', 'abdulmajidyusuf60@gmail.com', '07030570850', '$2b$10$bljCiN3P86Kw1y7hTcOveOVw8XybNayv0QCncA8IHgBxM74ulETlO', 'Abdulmajid', 'Yusuf', 'Nigeria', 'pending', 'CZ9QNXL3', NULL, FALSE, '{"account_number":"6686250835","account_name":"Abdulmajid  Yusuf(Payrant)","bank_name":"Payrant","account_reference":"REF-1775379097874","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-21T16:53:59.779Z', '2026-04-05T08:50:28.675Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-699a-8a48-19f2-0ddc42ab2910', 'adamusanigrk01@gmail.com', '07048367652', '$2b$10$e5Vh1LDpUtI9HDr4WsfWcuZblrNZ4IXDwHtJ1Sl9J.bDdk2SVDcL2', 'Adamu', 'Sani', 'Nigeria', 'pending', 'OUITA0SU', NULL, FALSE, '{}'::jsonb, 'active', '2026-02-22T04:47:04.841Z', '2026-02-22T04:47:04.841Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-699c-1927-494b-caf161265755', 'aminubdanmaigoro17@gmail.com', '08033269127', '$2b$10$ATNvIwt8SmMbinA8dxxb8.o5SXP073DbOyGMMzDCJxGDj2sXerUJO', 'Aminu ', 'Bello ', 'Nigeria', 'pending', 'CT04X6BC', NULL, FALSE, '{}'::jsonb, 'active', '2026-02-23T09:08:55.799Z', '2026-02-23T09:08:55.799Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69a0-b9b6-4141-dbfa7e09a47b', 'ummeegrk10@gmail.com', '08065730688', '$2b$10$651XeCsaTbwMh2MIN1uU5en7Mk35dHbSiVxdMw73TMOXesCIZNb0W', 'Adamu', 'Sani', 'Nigeria', 'pending', 'KHRPEBA4', NULL, FALSE, '{"account_number":"6634489366","account_name":"Adamu Sani(Payrant)","bank_name":"Payrant","account_reference":"69a0b9b64141dbfa7e09a47b-mm42e5nu","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-26T21:23:02.140Z', '2026-02-26T21:23:02.140Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69a3-6029-2a6b-f5607f362313', 'umarnajib681@gmail.com', '08133945635', '$2b$10$utxId3MXvhMAPddW/0YIr.eGiLlJD.qRXmXusfHdHwzcP5OIHqFYi', 'Najib', 'Umar', 'Nigeria', 'pending', '01M40W0V', NULL, FALSE, '{"account_number":"6648978466","account_name":"Najib Umar(Payrant)","bank_name":"Payrant","account_reference":"REF-1772314822707","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-02-28T21:37:45.690Z', '2026-02-28T21:37:45.690Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69a5-94ec-2a6b-f5607f3632e0', 'john.doe@example.com', '08012345678', '$2b$10$VlQVfs0Shj3u0Tzxg8dKsesEGLsrGzs9dc4N25evSdjIEWMw6F0BW', 'John', 'Doe', 'Nigeria', 'pending', 'XBCUGTJD', NULL, FALSE, '{}'::jsonb, 'active', '2026-03-02T13:47:24.659Z', '2026-03-02T13:47:24.659Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69a5-c6a3-2a6b-f5607f3634f5', 'aminuamee2025@gmail.com', '08034243801', '$2b$10$Sl6Q/Wz/yx0SyhTlgYj00OyCRErsRTrcxcZTAC.ehlbv6.0hHZhtq', 'Aminu', 'Muhammad ', 'Nigeria', 'pending', 'VN9O6C1W', NULL, FALSE, '{"account_number":"6663637277","account_name":"Aminu Muhammad(Payrant)","bank_name":"Payrant","account_reference":"REF-1776196705999","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-03-02T17:19:31.952Z', '2026-03-02T17:19:31.952Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69a7-15b5-17bc-f54fb1169e9a', 'umartijjani1331@gmail.com', '09033851685', '$2b$10$ig0Q91VOtJdciuWZE5bjWOthRTbjwaTzcoVAIJsh8naHovalbMCei', 'Umar', 'Maina', 'Nigeria', 'pending', '4D2DG9M4', NULL, FALSE, '{}'::jsonb, 'active', '2026-03-03T17:09:09.312Z', '2026-03-03T17:10:59.724Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69a9-4f06-17bc-f54fb116af62', 'yusifsuraja90@gmail.com', '08063111111', '$2b$10$h2f8DsV.lNdD48tmc4A78OSlGnerHz2Gkvfqa54SzWFnt3q45Dhum', 'Yusif ', 'Suraja', 'Nigeria', 'pending', '2Z9NTB0P', NULL, FALSE, '{}'::jsonb, 'active', '2026-03-05T09:38:14.489Z', '2026-03-05T09:38:14.489Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69aa-a70e-17bc-f54fb116bc4c', 'ridwangrk467074@gmail.com', '08147636656', '$2b$10$nw0wdi.LiqEC4kczn3OJdevP040QNkmNhCMVdGJCyZ3WN.SrO308e', 'RIDWAN ', 'YUSUF ', 'Nigeria', 'pending', '3M3FZDWN', NULL, FALSE, '{}'::jsonb, 'active', '2026-03-06T10:06:06.670Z', '2026-03-06T10:06:06.670Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69aa-bd44-17bc-f54fb116bf18', 'musbahusaidu164@gmail.com', '09124853619', '$2b$10$1VCvLwtaGTiUmKzpGqaNru2GjAQEScV72lIJisnOPXwVqe9iCPAK.', 'Musbahu', 'Saidu', 'Nigeria', 'pending', 'JST85LDA', NULL, FALSE, '{"account_number":"6667065094","account_name":"Musbahu Saidu(Payrant)","bank_name":"Payrant","account_reference":"REF-1772798483825","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-03-06T11:40:52.549Z', '2026-03-06T11:40:52.549Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69b5-480e-7264-b5316c0b0473', 'nuhualigarki2223@gmail.com', '09162548541', '$2b$10$t6sP0lqKh96TrTMmn5bR.uhcT03dZvfVVjSHFKMVzUAiD8jBHfJRq', 'Nuhu', 'Ali', 'Nigeria', 'pending', 'AW19GZO5', NULL, FALSE, '{}'::jsonb, 'active', '2026-03-14T11:35:42.385Z', '2026-03-14T11:35:42.385Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69b6-9035-7264-b5316c0b0cdc', 'khalifanasiruslu@gmail.com', '09157543048', '$2b$10$H0wApiC7HWREMdZzsEJ02eZR8mEmpwnq9X/IaRRsA0cNVB7RY22zq', 'Khalifa', 'Nasiru', 'Nigeria', 'pending', '5UPWTL4I', NULL, FALSE, '{"account_number":"6626513869","account_name":"Khalifa Nasiru(Payrant)","bank_name":"Payrant","account_reference":"REF-1773572727994","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-03-15T10:55:49.015Z', '2026-03-15T10:55:49.015Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69bd-b5ca-7264-b5316c0b4068', 'harunasanimurabus015@gmail.com', '07042177633', '$2b$10$.bKAO06o.GrXTTTb5HmZl.61cp7kvjWeuVaqYliHkMqRu6Sm.T1zK', 'Harunasani ', 'Murabus ', 'Nigeria', 'pending', 'Z3TEWTN4', NULL, FALSE, '{"account_number":"6630391692","account_name":"Harunasani  Murabus(Payrant)","bank_name":"Payrant","account_reference":"REF-1774040618170","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-03-20T21:02:02.574Z', '2026-03-20T21:02:02.574Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69c2-da31-7264-b5316c0b6a88', 'khalifaashiru12@gmail.com', '08162905018', '$2b$10$RXxM8cMZDMQD8SADqP.E8Os1nVWdw1N5/SMyAmRhwzHsJEIzcur8y', 'Halifh', 'Ashiru', 'Nigeria', 'pending', 'R4GBUTQW', NULL, FALSE, '{"account_number":"6648940793","account_name":"Halifh Ashiru(Payrant)","bank_name":"Payrant","account_reference":"REF-1774377556739","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-03-24T18:38:41.297Z', '2026-03-24T18:38:41.298Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69c3-0883-7264-b5316c0b6ef6', 'olaleremalik567@gmail.com', '09040453576', '$2b$10$Mc2GTyexEidc4cPDSoSnGON6vuU5l7uzA09NDqJ5cGisDvkCuzEJK', 'Malik', 'Olalere', 'Nigeria', 'pending', 'LMZUBPUK', NULL, FALSE, '{}'::jsonb, 'active', '2026-03-24T21:56:19.524Z', '2026-03-24T21:56:19.524Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69c3-8669-7264-b5316c0b6fcc', 'hamzaumarsu6318@gmail.com', '09063026689', '$2b$10$uOSNzh8/S4iqfKtR66nz9erFLOO.LYvVyU5f6JU5FNLXfeAfGUKw2', 'hamza', 'umar', 'Nigeria', 'pending', 'SH9XY39Y', NULL, FALSE, '{"account_number":"6664629275","account_name":"hamza umar(Payrant)","bank_name":"Payrant","account_reference":"69c386697264b5316c0b6fcc-mn5ouhne","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-03-25T06:53:29.896Z', '2026-03-25T06:53:29.896Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69c8-b1c1-7264-b5316c0b8b44', 'abbaabbakar80@gmail.com', '07065316053', '$2b$10$o/Ffl/zVL67fObzHHMpqs.e3R.JhQb2TvOAHg7aCXpMoRjyd2frw2', 'Abba ', 'Abubakar ', 'Nigeria', 'pending', 'F6PRR1DE', NULL, FALSE, '{}'::jsonb, 'active', '2026-03-29T04:59:45.172Z', '2026-03-29T04:59:45.172Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69cb-069a-7264-b5316c0b99b6', 'musagumel6@gmail.com', '9127172400', '$2b$10$NG4HejDmmfKp6qauNi54T.26U3TSHTp75JDnxWw6pzo8Gg3LA.sBW', 'Ahmad ', 'Muhammad Usman', 'Nigeria', 'pending', '6GF0JHIC', NULL, FALSE, '{}'::jsonb, 'active', '2026-03-30T23:26:18.619Z', '2026-03-30T23:26:18.619Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69cb-10d7-7264-b5316c0b99c1', 'Ahmadmuhammad271724@gmail.com', '09130782329', '$2b$10$iXIHZAvam95isJqFAweX8eMAInn/RL0IuJujm5cH3UFSZ88NarvVa', 'Ahmad ', 'Muhammad ', 'Nigeria', 'pending', 'R25FSMO5', NULL, FALSE, '{"account_number":"6616896122","account_name":"Ahmad  Muhammad(Payrant)","bank_name":"Payrant","account_reference":"REF-1774991248538","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-03-31T00:09:59.728Z', '2026-03-31T00:09:59.728Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69cc-b69b-7264-b5316c0ba234', 'manassebibrow6265@gmail.com', '08144725000', '$2b$10$hhgT9NfoZ07JLnYiKI.cEuxI8UKmuyOosiZ/Y4N.pZyRt0I4N3e0.', 'manasse', 'bibrow', 'Nigeria', 'pending', 'L6WCDWWY', NULL, FALSE, '{}'::jsonb, 'active', '2026-04-01T06:09:31.652Z', '2026-04-01T06:09:31.652Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69cf-7d44-7264-b5316c0bb27f', 'hafsatyahayasfn894@gmail.com', '08134733463', '$2b$10$8fhEA/kHxa09TSC4qqBy4OmpYv71sgUedSYo7fy36kb822bWTWG5C', 'Hafsat ', 'Yahaya ', 'Nigeria', 'pending', '3XR4ZBMO', NULL, FALSE, '{"account_number":"6608118785","account_name":"Hafsat  Yahaya(Payrant)","bank_name":"Payrant","account_reference":"REF-1775251986577","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-04-03T08:41:40.086Z', '2026-04-03T08:41:40.086Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69d4-1c7c-7264-b5316c0bcdc2', 'abdullahiahmed7709@gmail.com', '07042618335', '$2b$10$dqWfZpgBjydXDv4ZbrdfG.Bfj7H4mX92GQ.JvYHb9dfLFdj2sESpi', 'Abdullahi', 'Ahmad', 'Nigeria', 'pending', 'KB2400KR', NULL, FALSE, '{"account_number":"6626385999","account_name":"Abdullahi Ahmad(Payrant)","bank_name":"Payrant","account_reference":"REF-1775508983077","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-04-06T20:50:04.683Z', '2026-04-06T20:50:04.683Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69db-a462-7264-b5316c0bf31d', 'aishaaminubdn@gmail.com', '08136041529', '$2b$10$jYAf9ZA89GFmG0gZ89IpqO0G6rp3fo6yeodtl05ndVkN/GFwgocI6', 'Aisha', 'Aminu', 'Nigeria', 'pending', 'Z0ZNA7DF', NULL, FALSE, '{}'::jsonb, 'active', '2026-04-12T13:55:46.564Z', '2026-04-18T08:16:18.108Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69dd-1a46-7264-b5316c0bf83c', 'boybabandi@gmail.com', '09030892891', '$2b$10$aDQSbVGVCjADn1K5mRP4ZuD14GKEkg5VsrfsdMl70ygyKEo3kaC.K', 'Ahmad ', 'Babandi', 'Nigeria', 'pending', 'Q1V6LX4W', NULL, FALSE, '{}'::jsonb, 'active', '2026-04-13T16:31:02.112Z', '2026-04-13T16:31:02.112Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69dd-5437-7264-b5316c0bfc69', 'muhammadnuhualfa@gmail.com', '08065957107', '$2b$10$LBS05QgwTZMqcZR70UK8X.LNIWDwYCHCpCCHc7/QwuCzwvauvBGdW', 'Muhammad ', 'Nuhu Alfa', 'Nigeria', 'pending', '7NQV3CJO', NULL, FALSE, '{"account_number":"6607072811","account_name":"Muhammad  Nuhu Alfa(Payrant)","bank_name":"Payrant","account_reference":"REF-1776112785263","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-04-13T20:38:15.278Z', '2026-04-13T20:38:15.278Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69dd-fcec-7264-b5316c0c008c', 'smustaphaibrahim@gmail.com', '07039397069', '$2b$10$QA7x.IlgLEFYfAsjrHYc4Oevn1XTVpSc1DAnzrrfH4xvDP8bjlio.', 'SANI', 'IBRAHIM MUSTAPHA', 'Nigeria', 'pending', 'BEL5I1JF', NULL, FALSE, '{"account_number":"6657167292","account_name":"SANI IBRAHIM MUSTAPHA(Payrant)","bank_name":"Payrant","account_reference":"REF-1776424104777","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-04-14T08:38:04.004Z', '2026-04-17T11:06:00.665Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69de-12e0-7264-b5316c0c0148', 'ahmadgrk123@gmail.com', '09060730918', '$2b$10$YO3dUtzAowexo8Sxa8n0UO3RX3aFVSCIxtxcKEnnbv5rQkVCBYD1O', 'Ahmad', 'Ahmad', 'Nigeria', 'pending', 'Q1IGGLOP', '00000000-691c-8e9c-0905-272b76d063c7', FALSE, '{"account_number":"6627993829","account_name":"Ahmad Ahmad(Payrant)","bank_name":"Payrant","account_reference":"REF-1776161640597","provider":"payrant","status":"active"}'::jsonb, 'active', '2026-04-14T10:11:44.672Z', '2026-04-14T10:11:44.672Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69de-56a6-7264-b5316c0c02a4', 'umarmohdnaseerrng@gmail.com', '08067777765', '$2b$10$RcBDrZD1F5pV.O5b.hViKu1y2C.Uz8wYss00FhyOmdsH8fAvx.1nK', 'Abee', 'Samhat', 'Nigeria', 'pending', '0Q2ZZ88X', NULL, FALSE, '{}'::jsonb, 'active', '2026-04-14T15:00:54.831Z', '2026-04-14T15:00:54.832Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69df-6f37-7264-b5316c0c09a6', 'abbamusa@gmail.com', '08022216895', '$2b$10$BaAjB8E6NZ/8NyetlVleI.xrA2Bh.R5w3qOY2y7l6NG8IOFuL4ua2', 'Abba', 'Musa', 'Nigeria', 'pending', 'XENZVB7M', NULL, FALSE, '{}'::jsonb, 'active', '2026-04-15T10:57:59.732Z', '2026-04-15T10:57:59.732Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69df-79f9-7264-b5316c0c0a33', 'musaisah@gmail.com', '07022256982', '$2b$10$Ir2sv7UPjokBWcagb.MYY.sQWblAgpDr6yOpyumrNeyx4lk157wa6', 'Musa', 'Isah', 'Nigeria', 'pending', 'RXZ6VCE4', NULL, FALSE, '{}'::jsonb, 'active', '2026-04-15T11:43:53.883Z', '2026-04-15T11:43:53.883Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69df-888d-73c6-958a017cec1d', 'muhammadgarki002@gmail.com', '08137883502', '$2b$10$uxzX6aU9vYdXEK/97ui2fOic1aEab9bnc3LAr4gB0tq2GF0nExZIW', 'Muhammad ', 'Habibu ', 'Nigeria', 'pending', 'WP5BI1N8', NULL, FALSE, '{}'::jsonb, 'active', '2026-04-15T12:46:05.115Z', '2026-04-15T12:46:05.115Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69df-e169-73c6-958a017cf069', 'auwalbasirubm4@gmail.com', '09132598209', '$2b$10$i3ls9Q87OcTbgKIbWl6R1.8LtAIZ6jRobNtdjH6O9chz5F733pe9G', 'Auwal ', 'Basiru', 'Nigeria', 'pending', '0BDQN8CA', NULL, FALSE, '{}'::jsonb, 'active', '2026-04-15T19:05:13.780Z', '2026-04-15T19:05:13.780Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69e2-98ae-73c6-958a017d04c4', 'sabdustory@gmail.com', '08066029135', '$2b$10$WYxUv6KXqPyK25G/0Y..Bu0zxV6KUdSgwJ5GiHlUdNRtJExDzC1D6', 'Salisu', 'Abdu', 'Nigeria', 'pending', '7SJ82MVA', NULL, FALSE, '{}'::jsonb, 'active', '2026-04-17T20:31:42.201Z', '2026-04-17T20:31:42.201Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69e2-cc7f-73c6-958a017d0957', 'aliyaibrahim095@gmail.com', '09137335958', '$2b$10$uQwJm7Lyn7/TaRW9SRs9Tu5Hfjxb6uiHbTk7nS5pBaJ09j24xiLcK', 'Aliya', 'Ibrahim', 'Nigeria', 'pending', 'USNXVZEX', NULL, FALSE, '{}'::jsonb, 'active', '2026-04-18T00:12:47.347Z', '2026-04-18T00:12:47.347Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69e4-df9b-73c6-958a017d16e8', 'auwalsuleman614@gmail.com', '07061391744', '$2b$10$EVS.YbCqpPk52JzD49zuqOXygqWEKYlniE.ugKHi22COXyVQIumKy', 'Auwal', 'Sulaiman', 'Nigeria', 'pending', 'UORAELI4', NULL, FALSE, '{}'::jsonb, 'active', '2026-04-19T13:58:51.940Z', '2026-04-19T13:58:51.940Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69e8-a0cc-1b83-c92d32043ebc', 'ibrahimsulemangrk@gmail.com', '09169729775', '$2b$10$saIxM46z8TCisNGReoek5e2uWtvTK0r2H1HpBTFxViGsNxrdBwl46', 'Ibrahim', 'Suliaman', 'Nigeria', 'pending', '4OW5V52O', NULL, FALSE, '{}'::jsonb, 'active', '2026-04-22T10:19:56.840Z', '2026-04-22T10:19:56.840Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69e9-3835-1b83-c92d320443c4', 'umaraliyugrk2005@gmail.com', '08032954414', '$2b$10$q3/DizRmjIXQOHkPj185JuXWdfzFiHcvXgY0nMJiq48sZTuDN9Rq2', 'Umar ', 'Aliyu ', 'Nigeria', 'pending', '2J9PQD9E', NULL, FALSE, '{}'::jsonb, 'active', '2026-04-22T21:05:57.094Z', '2026-04-22T21:05:57.094Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69ea-76f1-1b83-c92d3204475e', 'umaribrahimgrk012@gmail.com', '07038676342', '$2b$10$0kDhXWERGOBDh/Uaxn3zsOtFgK.KleJJOzrnq4hAnGU5mnc9lGiVu', 'Umar ', 'Ibrahim ', 'Nigeria', 'pending', 'KYZU7BJT', NULL, FALSE, '{}'::jsonb, 'active', '2026-04-23T19:45:53.464Z', '2026-04-23T19:45:53.464Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69ea-a6e5-1b83-c92d32044906', 'klingrk1@gmail.com', '07084072489', '$2b$10$o7NWXyA43Yz4wHoPv.qzTuT06xRidSiy8F/pafuyfnkplKJDf98oG', 'adamu', 'sani', 'Nigeria', 'pending', 'E5OOCU0H', '00000000-691c-8e9c-0905-272b76d063c7', FALSE, '{}'::jsonb, 'active', '2026-04-23T23:10:29.799Z', '2026-06-06T13:32:05.270Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69eb-0856-1b83-c92d32044973', 'nafiuabdullahigarki@gmail.com', '08136786376', '$2b$10$YJX9Ou7cTABtukwgjowP/.8MrYiCTFcwsl.4tkzhKlYQU1nqQru7a', 'Nafiu', 'Abdullahi', 'Nigeria', 'pending', 'ML55Y2MR', NULL, FALSE, '{}'::jsonb, 'active', '2026-04-24T06:06:14.691Z', '2026-04-24T06:06:14.691Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69eb-b01f-1b83-c92d32044bfc', 'mubarakmuhammad164@gmail.com', '08166903531', '$2b$10$iZpEWLOBfp0RmAFE/JzUtuPbrP6AY1DGIZrCCHvdWEAHYMRKV/w5m', 'Mubarak ', 'Muhammad ', 'Nigeria', 'pending', '3FKTDQDP', NULL, FALSE, '{}'::jsonb, 'active', '2026-04-24T18:02:07.240Z', '2026-04-24T18:02:07.240Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69eb-c665-1b83-c92d32044cfd', 'abubakarabdullahiabbani@gmail.com', '08134359822', '$2b$10$0O8i4yMlwhm5oyxn5uef5.fGfnzmAR3W1iu.zDVuPPTO2x.tLh72u', 'Abubakar ', 'Abdullahi ', 'Nigeria', 'pending', '25LEEYKD', NULL, FALSE, '{}'::jsonb, 'active', '2026-04-24T19:37:09.720Z', '2026-04-24T19:37:09.720Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69ed-19f3-1b83-c92d32045433', 'ahmadbabangida603@gmail.com', '08131994894', '$2b$10$bsKpQBKT3WJ3l7pBI3ODZ.JmRfN7JtZBeoJ8cpFq6Vuf3li3dmQEi', 'Babangida ', 'Ahmad ', 'Nigeria', 'pending', '8LFGTMWI', NULL, FALSE, '{}'::jsonb, 'active', '2026-04-25T19:45:55.566Z', '2026-04-25T19:45:55.566Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69ee-86c6-1b83-c92d32045e0d', 'muslimabdussamad22@gmail.com', '08064060802', '$2b$10$6g0VQhFDthkrN4yYWRDVL.OcaVRfJLmR6ELfvR2F9dGYEiS0bvyBa', 'Muslim', 'Abdussamad', 'Nigeria', 'pending', 'W4U8I2V9', NULL, FALSE, '{}'::jsonb, 'active', '2026-04-26T21:42:30.698Z', '2026-04-27T18:41:13.800Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69ef-e0ee-1b83-c92d32046492', 'saiduhabu410@gmail.com', '08135518194', '$2b$10$veGwA13QJDRUoYh2QCx5/.gJoYJ19MB0q58B4BwQ0Spam3RUOQcly', 'Saidu ', 'Habu', 'Nigeria', 'pending', 'TGWPBVN3', '00000000-691c-8e9c-0905-272b76d063c7', FALSE, '{}'::jsonb, 'active', '2026-04-27T22:19:26.529Z', '2026-04-27T22:19:26.529Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69f2-0a37-1b83-c92d32046e40', 'musalabourarewa5456@gmail.com', '08107325456', '$2b$10$cWP0MJs2RAT80UiMHhFYj.uUuSEVn/8WXzTErQk3.wp7PrMGoqS3K', 'Musa', 'Abdullahi', 'Nigeria', 'pending', 'R9Z02WIO', NULL, FALSE, '{}'::jsonb, 'active', '2026-04-29T13:40:07.480Z', '2026-04-29T13:40:07.480Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69f3-2130-1b83-c92d320473fc', 'habuyusifgrk@gmail.com', '07034947993', '$2b$10$8TatNIdsRrBop8tbR/D1lOaBIYOJG/xxQEJucTPfU5UNxhmy5Rn3K', 'habu', 'yusif', 'Nigeria', 'pending', 'A7LOLHC4', NULL, FALSE, '{}'::jsonb, 'active', '2026-04-30T09:30:24.240Z', '2026-04-30T09:30:24.240Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69f5-f3d2-1b83-c92d3204827a', 'ismailadamudaddy@gmail.com', '09161800640', '$2b$10$BEJfNDXY4H051dE7.X8u8.AielV/KX.sfzMJKO0YQyw6iCUwlflGO', 'ISMAIL ', 'ADAMU ', 'Nigeria', 'pending', 'T5OOCNMU', NULL, FALSE, '{}'::jsonb, 'active', '2026-05-02T12:53:38.574Z', '2026-05-02T12:53:38.574Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69f6-0554-1b83-c92d3204831f', 'muhammadshuaibugrk2@gmail.com', '09063494327', '$2b$10$HC6Fi45rwzxFMiozVreFy.VE0.hHxfWFxj0j4IEVordxt2.lrP7Ca', 'Muhammad ', 'Shuaibu Muhammad ', 'Nigeria', 'pending', '6JL3HVCQ', NULL, FALSE, '{}'::jsonb, 'active', '2026-05-02T14:08:20.187Z', '2026-05-02T14:08:20.187Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69f7-3175-1b83-c92d32048afd', 'sanihadejia@gmail.com', '07078251568', '$2b$10$fdGflyD3OdG9WXF.2CeWnOrsO3Lu.q0vIar73B0RXkDcb0CZxoy6u', 'Sani ', 'Kabiru ', 'Nigeria', 'pending', 'BPCEZT5L', '00000000-69a5-c6a3-2a6b-f5607f3634f5', FALSE, '{}'::jsonb, 'active', '2026-05-03T11:28:53.132Z', '2026-05-03T11:28:53.132Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69f7-a01c-1b83-c92d32048cb6', 'auwaluaminugarki@gmail.com', '09162806734', '$2b$10$nGj3xvqQ7ptegUK4d.mkb.z5Z5N32q1wIGNkb4u0kQOA19vmg.RLm', 'Auwalu', 'Gwaska', 'Nigeria', 'pending', 'VT2O54IL', NULL, FALSE, '{}'::jsonb, 'active', '2026-05-03T19:21:00.093Z', '2026-05-03T19:21:00.093Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69f8-f2df-1b83-c92d32049256', 'mrcoder@gmail.com', '08080564121', '$2b$10$SXc2RdEocMEe1.vFwLTziubDBQ0JU74D.yXcg9hxQzLBP/FBkpwGu', 'Usman', 'Umar', 'Nigeria', 'pending', 'ZLQYDZVY', NULL, FALSE, '{}'::jsonb, 'active', '2026-05-04T19:26:23.950Z', '2026-05-04T19:26:23.950Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69fa-071b-1b83-c92d32049842', 'zimnadenterprise@gmail.com', '08086013189', '$2b$10$mH8.o6X4SAPjxpcglVV5E.nYeqRjGgWQOrSuiuvXMC4AFXtkA.l1K', 'Zahraddeen ', 'Ibrahim ', 'Nigeria', 'pending', '8KZPE3JZ', NULL, FALSE, '{}'::jsonb, 'active', '2026-05-05T15:04:59.913Z', '2026-05-05T15:04:59.913Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69fb-1a8b-1b83-c92d32049e2d', 'musaalisani79@gmail.com', '07061455797', '$2b$10$CYfKstp/Jubkbubf3j6QFuMfGCLtUoFzupSUY1F7lgo5SxhipNESa', 'Musa', 'Ali', 'Nigeria', 'pending', 'FYVBBSPA', '00000000-691c-8e9c-0905-272b76d063c7', FALSE, '{}'::jsonb, 'active', '2026-05-06T10:40:11.876Z', '2026-05-06T10:40:11.876Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69fb-39ef-1b83-c92d32049f3b', 'aliyugoduro@gmail.com', '09042445200', '$2b$10$HULrKDCkTPu.WT5F8puPEeAvN9fkLwiC4fBk79T8bh63q.ajzwj62', 'Aleeyu', 'Goduro', 'Nigeria', 'pending', 'YD8FE5A2', NULL, FALSE, '{}'::jsonb, 'active', '2026-05-06T12:54:07.552Z', '2026-05-06T12:54:07.552Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69fb-c2c9-1b83-c92d3204a24d', 'alhajimamudamudagrk@gmail.com', '08030860172', '$2b$10$dFSgFnDsfYFaBpUsntaRiO.gQipdnIEUxNMCUxbJe4ZUu9yN7s5A6', 'Alhaji', 'Mamuda', 'Nigeria', 'pending', 'MVLAIF1V', NULL, FALSE, '{}'::jsonb, 'active', '2026-05-06T22:38:01.715Z', '2026-05-06T22:38:01.715Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69fc-1cb6-1b83-c92d3204a2c5', 'saifullahiibrahim4082@gmail.com', '08030593272', '$2b$10$KXj1v56S/fkTWQFpVGg7V.93X/SOsu9uMLLf4dxuOzmrByr4.ZTJK', 'saifullahi ', 'Ibrahim ', 'Nigeria', 'pending', 'RDVYUD9R', NULL, FALSE, '{}'::jsonb, 'active', '2026-05-07T05:01:42.519Z', '2026-05-07T05:01:42.519Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69fd-f47f-1b83-c92d3204a9ab', 'dauntygk@gmail.com', '07060464015', '$2b$10$Qo7cvM1Vm2a2lnU2VopB/O0JzX2Ie3U3Oax32dw3Y2QpQ2Q6j9qAK', 'Abubakar ', 'Basiru ', 'Nigeria', 'pending', '02T0N9I4', NULL, FALSE, '{}'::jsonb, 'active', '2026-05-08T14:34:39.921Z', '2026-05-08T14:34:39.921Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69ff-0b82-1b83-c92d3204aff3', 'auduaudu1111@gmail.com', '08036117015', '$2b$10$7jTulZ9WZNtqRpVvlAazGeHWtwjrxtYBJfiIwDoF3xvI49zksEt7W', 'Abdullahi', 'Muhammad ', 'Nigeria', 'pending', 'DWY565QQ', NULL, FALSE, '{}'::jsonb, 'active', '2026-05-09T10:25:06.843Z', '2026-05-09T10:27:27.075Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69ff-a0bb-1b83-c92d3204b3bc', 'harunayusifadede52@gmail.com', '09063890252', '$2b$10$RR4T9550RblQ1WRD8DYIguOl4Ya5lf01p1bLQbgMIuDUFbBgtachq', 'Haruna', 'Yusif', 'Nigeria', 'verified', '95BC21FJ', NULL, FALSE, '{}'::jsonb, 'active', '2026-05-09T21:01:47.381Z', '2026-06-04T14:46:24.798Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6a00-dcf6-1b83-c92d3204baee', 'munkailamukhtar2560@gmail.com', '09037645097', '$2b$10$t04qj7X4kg2VdzVt1syyNeu86RlZHFirBD4gUzVIEYb5IK39y7xrS', 'Mukhtar ', 'Munkaila ', 'Nigeria', 'pending', 'ZMFKBDSO', NULL, FALSE, '{}'::jsonb, 'active', '2026-05-10T19:31:02.186Z', '2026-05-10T19:31:02.186Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6a02-45b2-1b83-c92d3204c5d9', 'guruzagrk123@gmail.com', '09021505111', '$2b$10$4Q4eL4956ZvgE2bKVhZULOymLZDxz.rk2xUHguojJqe00n1q0wmD6', 'Ahmad', 'Ahmad', 'Nigeria', 'pending', 'EF2GZS0Y', NULL, FALSE, '{}'::jsonb, 'active', '2026-05-11T21:10:10.382Z', '2026-05-11T21:10:10.382Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6a03-39f9-1b83-c92d3204c874', 'babaleledangambo2020@gmail.com', '09122981603', '$2b$10$Z1z0XUmFbZCdyF2Zv5aPd.uEjyUZvbsRf1QKCYqizNX38YV8R7HQK', 'Babalele', 'Dangambo', 'Nigeria', 'pending', 'LMPSKRZO', NULL, FALSE, '{}'::jsonb, 'active', '2026-05-12T14:32:25.926Z', '2026-05-12T14:32:25.926Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6a03-4663-1b83-c92d3204c895', 'sadeeqauwalmuhd02@gmail.com', '09076457144', '$2b$10$Tw.xXbDdZ4SywEhth3bGd.cr6aQW.503rrUKcSgQL0b14WbWSMajq', 'Abubakar', 'Auwal Muhammad', 'Nigeria', 'verified', 'Z3K37K2N', NULL, FALSE, '{}'::jsonb, 'active', '2026-05-12T15:25:23.352Z', '2026-05-12T18:07:24.743Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6a04-db63-1b83-c92d3204d3d3', 'abdullahiyusifu1234@gmail.com', '07089253060', '$2b$10$WE8E0Hod3Peq/.X2sfodueTD2bggLltH9iY0fwj.J6kCEi8kxdCwe', 'Abdullahi ', 'Yusuf ', 'Nigeria', 'verified', '54XSLXE9', NULL, FALSE, '{}'::jsonb, 'active', '2026-05-13T20:13:23.899Z', '2026-05-30T17:13:55.068Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6a05-85df-1b83-c92d3204d713', 'yusufisahumar8@gmail.com', '08104045590', '$2b$10$ss6wY/Ar/S2XN4S0utfWRuhjaRri0tyU4IdyVlweX9o5s2AeW00ry', 'Yusuf ', 'Isah Umar ', 'Nigeria', 'pending', '2MKDOV68', NULL, FALSE, '{}'::jsonb, 'active', '2026-05-14T08:20:47.301Z', '2026-05-14T08:20:47.301Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6a05-ed1d-1b83-c92d3204d8c4', 'kamalasulaimangrk@gmail.com', '09164640466', '$2b$10$0DxT9/UaXFgw0YWcdqu7kOhErRaaEO6WkcLIjnrrgy5GFgZPPr4bW', 'Kamala', 'Sulaiman', 'Nigeria', 'pending', 'MFNRAN4T', NULL, FALSE, '{}'::jsonb, 'active', '2026-05-14T15:41:17.741Z', '2026-05-14T15:41:17.741Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6a08-89a4-1b83-c92d3204e4a7', 'muhammadgrk0482@gmail.com', '08066615998', '$2b$10$zJcpbPEG2JODecnEQLtZpuSHNrZtsILp4TyYpugP4wCyv0p62Z1pO', 'Muhammad', 'Sulaiman', 'Nigeria', 'pending', 'M8A8DICG', NULL, FALSE, '{}'::jsonb, 'active', '2026-05-16T15:13:40.640Z', '2026-05-16T15:13:40.640Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6a0a-2b48-1b83-c92d3204ef06', 'abdullahiyusufgrk@gmail.com', '07039517058', '$2b$10$0g9xRMkR/SKL1iyJHSppEeYv9zZ6GUCeEvOwXktO.tXC/TiVOvMiG', 'Abdullahi', 'Yusuf', 'Nigeria', 'pending', 'SLQ9R05T', NULL, FALSE, '{}'::jsonb, 'active', '2026-05-17T20:55:36.127Z', '2026-05-17T20:58:00.958Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6a0a-2cf2-1b83-c92d3204ef3a', 'abdullahiyusuf2923@gmail.com', '09068681199', '$2b$10$Qdq93i2hDOgQEHAOAY8bV.RLButJx5bFxlJ7MGOsLkDvqdfGQm/du', 'Musa', 'Yusuf', 'Nigeria', 'pending', 'JH10YJFU', NULL, FALSE, '{}'::jsonb, 'active', '2026-05-17T21:02:42.794Z', '2026-05-17T21:02:42.794Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6a0a-e891-1b83-c92d3204f1a2', 'adamuumarabdullahigarki01@gmail.com', '08162834380', '$2b$10$5pEMzDi9yO5SNk3t.kb7iuLfDvYnptWQ2JIe1ASv8xcJ.b2u5MUeW', 'Adamu ', 'Umar ', 'Nigeria', 'pending', 'LIV4DYKB', NULL, FALSE, '{}'::jsonb, 'active', '2026-05-18T10:23:13.746Z', '2026-05-18T10:23:13.746Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6a0a-f115-1b83-c92d3204f241', 'sadiqisahhamza@gmail.com', '08149104357', '$2b$10$WvaV6vS8kV8Kempm1HEYIOoJ0JKAfCmyCXUHGx.b68pv5fmHe0Fd6', 'Sadiq', 'Isah Hamza', 'Nigeria', 'pending', 'LWJ42FCV', '00000000-691c-8e9c-0905-272b76d063c7', FALSE, '{}'::jsonb, 'active', '2026-05-18T10:59:33.135Z', '2026-05-18T11:03:29.619Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6a0b-6ab6-1b83-c92d3204f4a0', 'musaisahgrk1995@gmail.com', '09125363067', '$2b$10$GnY/paGuxpzqBJBvpnTU4e84.j/24W1zoxa/0H5.E6R8SF2MRYT9.', 'Isah', 'Musa', 'Nigeria', 'pending', '1VX253GJ', '00000000-6a00-dcf6-1b83-c92d3204baee', FALSE, '{}'::jsonb, 'active', '2026-05-18T19:38:30.989Z', '2026-05-18T19:38:30.989Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6a0b-98ef-1b83-c92d3204f6e7', 'muhammadamadu450@gmail.com', '08109958993', '$2b$10$ZtfjWflWPTi68focUs67uO6pMNLXHPb1lsVo/Dzx9V/46frmFC.kW', 'Amadu ', 'Mohammed ', 'Nigeria', 'pending', '2W1G3201', NULL, FALSE, '{}'::jsonb, 'active', '2026-05-18T22:55:43.722Z', '2026-05-18T22:55:43.722Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6a0c-54cb-1b83-c92d3204fa0a', 'mubeelam@gamil.com', '08160712128', '$2b$10$CmuAsOd2I1nip5sJ3qEceuXe845r1chiRfcpFY6zlP190K4HWYhpe', 'Mubeel ', 'Garki', 'Nigeria', 'pending', 'KOXNU9J0', '00000000-691c-8e9c-0905-272b76d063c7', FALSE, '{}'::jsonb, 'active', '2026-05-19T12:17:15.901Z', '2026-05-19T12:17:15.901Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6a0c-891e-1b83-c92d3204fbd5', 'abdullahialigrk8080@gmail.com', '09163843140', '$2b$10$MhwQaFEOm/RK2XqXj4H2Gu6AqhvaI424vz/Dx0z6YjCHz8/UT30rC', 'Abdullahi', 'Ali', 'Nigeria', 'pending', 'AXJ9FCAQ', '00000000-691c-8e9c-0905-272b76d063c7', FALSE, '{}'::jsonb, 'active', '2026-05-19T16:00:30.331Z', '2026-05-19T16:00:30.331Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6a10-3738-1b83-c92d32050da1', 'avuvarkarevraherm@gmail.com', '07060715713', '$2b$10$3krTot/4P/qRRF6HV8LEYe8r.3/.Q8cDzpBMpXq29ztmMIyb76Fmq', 'Abubakar', 'Ibrahim', 'Nigeria', 'pending', 'EUEUAIY5', NULL, FALSE, '{}'::jsonb, 'active', '2026-05-22T11:00:08.619Z', '2026-06-19T21:16:17.309Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6a10-e992-1b83-c92d320510bf', 'daudamusbahu30@gmail.com', '08036962878', '$2b$10$TLOZKexYz6X/BAvzxFRWq.3rDxktNllrB9MLSdzU0Ab30Wm/Exfoy', 'Dauda', 'Musabahu', 'Nigeria', 'pending', 'WTGIC437', NULL, FALSE, '{}'::jsonb, 'active', '2026-05-22T23:41:06.666Z', '2026-05-22T23:41:06.666Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6a12-cc0e-1b83-c92d3205170d', 'aliyaibrahim113@gmail.com', '09060997708', '$2b$10$dg0I8eiO3CpB93Jb792NKuHps74wIAxBgQhOw3ugOCF.4qWrOEbnO', 'Aliya', 'Ibrahim', 'Nigeria', 'pending', 'ZRDXLZUT', NULL, FALSE, '{}'::jsonb, 'active', '2026-05-24T09:59:42.858Z', '2026-05-24T09:59:42.858Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6a16-a58b-48ca-75899e17d54d', 'abdurrahmanaliyugrk1@gmail.com', '08136760151', '$2b$10$rZhxhsN..Drh3ZgHdUG25uDknxV8fxZFTvJFQRJw8av1gMyTYHQzK', 'ABDURRAHMAN ', 'ALIYU', 'Nigeria', 'pending', 'ASVODP4N', '00000000-691c-8e9c-0905-272b76d063c7', FALSE, '{}'::jsonb, 'active', '2026-05-27T08:04:27.453Z', '2026-05-27T08:04:27.453Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6a17-5896-48ca-75899e17dbd7', 'sadiqkabirauwal@gmail.com', '07018858493', '$2b$10$LUYlinmJBB919uj26ZUmo.FH602MvnBJLsejzN5/xrTvYhI.nV6DK', 'Sadiq', 'Kabir', 'Nigeria', 'pending', 'HH6SPEP5', NULL, FALSE, '{}'::jsonb, 'active', '2026-05-27T20:48:22.649Z', '2026-05-27T20:56:03.012Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6a19-dcf5-48ca-75899e17e78d', 'um210480@gmail.com', '08147627474', '$2b$10$JyZIk7jFd0utA8OcM46RcO27bAN4dPEmpi9YAERV16YTw/ZfV7Hku', 'Umar', 'Mukhtar ', 'Nigeria', 'pending', 'Y50LUGZD', NULL, FALSE, '{}'::jsonb, 'active', '2026-05-29T18:37:41.293Z', '2026-05-29T18:37:41.293Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6a1c-072a-48ca-75899e17f26f', 'habibagarba@gmail.com', '08105442810', '$2b$10$XyVODGFooZmWNHw1V930dezc/vbC66tWgvTgGYolcTVM5.pdQTcya', 'Habiba ', 'Garba', 'Nigeria', 'pending', '7E0TKXIR', NULL, FALSE, '{}'::jsonb, 'active', '2026-05-31T10:02:18.775Z', '2026-05-31T10:02:18.775Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6a24-4833-48ca-75899e18117f', 'agarki24@gmail.com', '07061480481', '$2b$10$/bVtnEsIcE43C5U6Mz2Q9.eqZ5Fcp2vUMjM944KP.KLcZzPqrR9DO', 'Mujittapha', 'Abdu', 'Nigeria', 'pending', '8HM60VZI', NULL, FALSE, '{}'::jsonb, 'active', '2026-06-06T16:17:55.253Z', '2026-06-06T16:17:55.253Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6a26-e36f-48ca-75899e181a45', 'hassaniliyasugarb@gmail.com', '07082795916', '$2b$10$TFNCbyFHU5mkucGGXoPSJ.3Y12AriM5.idMbV3vkvvn6spyZoHwoi', 'Hassan', 'Iliyasu Garba', 'Nigeria', 'pending', 'LD5WF1OL', NULL, FALSE, '{}'::jsonb, 'active', '2026-06-08T15:44:47.891Z', '2026-06-08T15:44:47.891Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6a2f-2168-48ca-75899e1836eb', 'Aminunafiu20@gmail.com', '09010653432', '$2b$10$GHq/4H7XtPWjwPM7vjvTSuNiAN539a.RB7TBlQXuAcWLhago4anO6', 'Ameeenou', 'Nafeeu', 'Nigeria', 'pending', 'NYKBL6R2', NULL, FALSE, '{}'::jsonb, 'active', '2026-06-14T21:47:20.427Z', '2026-06-14T21:47:20.427Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6a2f-b43b-48ca-75899e183743', 'sadiqyusuf0364@gmail.com', '08029453772', '$2b$10$0ikQ6h3/jWYINuKLcGUK9.gik4UPaUkClAejPIP0htfUbxTegtHsq', 'Sadiq', 'Yusuf', 'Nigeria', 'pending', 'JEDXMXJW', NULL, FALSE, '{}'::jsonb, 'active', '2026-06-15T08:13:47.744Z', '2026-06-15T08:13:47.744Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6a32-78b2-48ca-75899e183ed4', 'alkasimbadamasi65@gmail.com', '09026133507', '$2b$10$ELFtg.tH2lAZT51L07ACIeLwD4UoUMDqP0FdATW8TCCJwSPvsWo2O', 'Alkasim', 'Badamasi ', 'Nigeria', 'pending', 'VHOWTETD', NULL, FALSE, '{}'::jsonb, 'active', '2026-06-17T10:36:34.484Z', '2026-06-17T10:36:34.484Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6a3b-a080-14ff-47214c20291e', 'jcihwhfx@sharklasers.com', '80300000000', '$2b$10$iYrAa0pOmqVrwdsmYJtwJ.4ltsoeTD1YQ0pa1KohpHv03oD6YQe/6', 'First', 'Last', 'Nigeria', 'pending', 'XZFTPF42', NULL, FALSE, '{}'::jsonb, 'active', '2026-06-24T09:16:48.979Z', '2026-06-24T09:16:48.979Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6a3f-a1db-14ff-47214c20325b', 'aliyuzaki3875@gmail.com', '08138750535', '$2b$10$bjP.2OxWYvXBmWb76gC8r.Wc6s6xN6Lnkc07JblNwgNRRzOjAdaSG', 'Ali', 'Abdul', 'Nigeria', 'pending', 'DS1N4WSK', NULL, FALSE, '{}'::jsonb, 'active', '2026-06-27T10:11:39.742Z', '2026-06-27T10:11:39.742Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6a4b-78e9-14ff-47214c204c31', 'ui806123@gmail.com', '07063406635', '$2b$10$HOe7E7rf1NTH/FY4.EIisu6EnKV4KhQYrAYfawhLw/BlnqtM3S4Ce', 'Unar', 'Ibrahim ', 'Nigeria', 'pending', 'XN1EFUCE', NULL, FALSE, '{}'::jsonb, 'active', '2026-07-06T09:44:09.550Z', '2026-07-06T09:44:09.550Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6a4e-a979-14ff-47214c2053ef', 'ibrahimmuhammadgml20@gmail.com', '90655598631', '$2b$10$QSdG8Zw4/oNtvh1Pdbu5juesQxTyVidq0f2PgzhF8.giVB63Xp0R6', 'Ibrahim ', 'Muhammad ', 'Nigeria', 'pending', '9S9MEW7H', NULL, FALSE, '{}'::jsonb, 'active', '2026-07-08T19:48:09.006Z', '2026-07-08T19:48:09.006Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6a54-1ece-14ff-47214c20614d', 'isahisahhamza7@gmail.com', '08133887131', '$2b$10$6r3twvLYhYQDqUUd9RIXYuTc27MGm9a/dmE/JCPfCo57cIKZnxFMC', 'Isah Isah ', 'Hamza', 'Nigeria', 'pending', 'SHO1ZIUI', NULL, FALSE, '{}'::jsonb, 'active', '2026-07-12T23:10:06.288Z', '2026-07-12T23:10:06.288Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6a54-dd9e-14ff-47214c2061f4', 'usmanbarester@gmail.com', '08037523524', '$2b$10$c4gkBML1DUTV5qzoRvVpteMzJoaFXHeJGagJUGzHBolSLdnxaMcrC', 'Usman ', 'Ahmad ', 'Nigeria', 'pending', 'V8IRUF5M', NULL, FALSE, '{}'::jsonb, 'active', '2026-07-13T12:44:14.027Z', '2026-07-13T12:44:14.027Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6910-a803-9ee6-fac09d81f88f', 'archived_user_1@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6910-c05d-466d-6b359621dcd5', 'archived_user_2@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6910-c36c-466d-6b359621dd44', 'archived_user_3@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6910-d47d-466d-6b359621decc', 'archived_user_4@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6911-af82-466d-6b359621dfc2', 'archived_user_5@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6911-dd9b-efea-b41fdcf20564', 'archived_user_6@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6912-c53b-13ca-4b97ddad1723', 'archived_user_7@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6912-fc24-13ca-4b97ddad1754', 'archived_user_8@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6913-784f-7d85-25d51744027f', 'archived_user_9@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6918-85ba-f8b7-f7435f4950f5', 'archived_user_10@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-691a-20bb-3f28-20aed7b2f979', 'archived_user_11@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-691a-2906-3f28-20aed7b2fa7b', 'archived_user_12@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-691d-c0ce-60fe-50767ffc3443', 'archived_user_13@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6920-ef1e-e195-e70de4cc3701', 'archived_user_14@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6922-30ff-e195-e70de4cc397c', 'archived_user_15@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6925-e811-23d5-b6aac28734a1', 'archived_user_16@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6926-b1fd-23d5-b6aac2873707', 'archived_user_17@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6926-eb42-23d5-b6aac2873981', 'archived_user_18@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6927-0e0b-4480-22289fe2d433', 'archived_user_19@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6927-2cb5-4480-22289fe2d571', 'archived_user_20@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6927-4b47-4480-22289fe2d5ee', 'archived_user_21@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6927-8016-4480-22289fe2d7e9', 'archived_user_22@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6928-7cc6-4480-22289fe2db38', 'archived_user_23@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6929-29fa-4480-22289fe2dd9e', 'archived_user_24@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6929-ffb6-4480-22289fe2e0b6', 'archived_user_25@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-692a-8c09-4480-22289fe2e3e0', 'archived_user_26@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-692c-9f8b-4480-22289fe2ee75', 'archived_user_27@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-692d-7cf6-4480-22289fe2f094', 'archived_user_28@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-692e-a7d7-4480-22289fe2f5b5', 'archived_user_29@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6939-df98-eeea-3fc22a3b6248', 'archived_user_30@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6939-e4d9-de74-fefd3f965fc3', 'archived_user_31@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6939-e5f9-eeea-3fc22a3b62c3', 'archived_user_32@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6941-b7dd-eeea-3fc22a3b6fcd', 'archived_user_33@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6942-caa6-de74-fefd3f966e91', 'archived_user_34@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6945-8e98-de74-fefd3f9672e8', 'archived_user_35@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6946-f4c9-de74-fefd3f967668', 'archived_user_36@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6949-1bcf-de74-fefd3f9679ef', 'archived_user_37@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-694a-a1b0-de74-fefd3f967d9b', 'archived_user_38@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-694a-a30e-de74-fefd3f967dcb', 'archived_user_39@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-694c-ee2a-de74-fefd3f9682db', 'archived_user_40@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6952-d1b5-eeea-3fc22a3b9521', 'archived_user_41@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6953-8d81-eeea-3fc22a3b9685', 'archived_user_42@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6959-9a4e-8b59-d9ec210300db', 'archived_user_43@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-695a-1b6b-8b59-d9ec21030165', 'archived_user_44@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-695a-70ab-6221-f213880faef2', 'archived_user_45@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-695a-77d5-8b59-d9ec210302e5', 'archived_user_46@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-695a-d1be-8b59-d9ec21030629', 'archived_user_47@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-696a-0e94-27eb-059addcfcf24', 'archived_user_48@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-696a-420d-e751-5e1550bdf85b', 'archived_user_49@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6974-d0b4-27eb-059addcfeb52', 'archived_user_50@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-697c-d46d-27eb-059addd00161', 'archived_user_51@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-697c-e21d-e751-5e1550be28b1', 'archived_user_52@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-697d-b147-e751-5e1550be2c2d', 'archived_user_53@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6980-599f-e751-5e1550be3941', 'archived_user_54@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6981-f165-e751-5e1550be408a', 'archived_user_55@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6982-55f2-e751-5e1550be4220', 'archived_user_56@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6982-d6c5-e751-5e1550be4332', 'archived_user_57@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6983-7550-27eb-059addd01ec1', 'archived_user_58@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6983-7fc2-27eb-059addd01f0d', 'archived_user_59@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6983-af9f-27eb-059addd01fe9', 'archived_user_60@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6983-afb5-e751-5e1550be4616', 'archived_user_61@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6984-6d8c-27eb-059addd02415', 'archived_user_62@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6984-7921-e751-5e1550be4a1d', 'archived_user_63@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6984-a4c0-e751-5e1550be4b4e', 'archived_user_64@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6984-b752-e751-5e1550be4c41', 'archived_user_65@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6984-b76e-27eb-059addd0265a', 'archived_user_66@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6985-98f1-e751-5e1550be5111', 'archived_user_67@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-698a-059c-494b-caf161260891', 'archived_user_68@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-698a-05f7-19f2-0ddc42aae32c', 'archived_user_69@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-698a-cd4c-19f2-0ddc42aae70f', 'archived_user_70@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69a9-9f73-17bc-f54fb116b272', 'archived_user_71@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69b6-72da-7264-b5316c0b0b15', 'archived_user_72@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69b6-757d-7264-b5316c0b0b7b', 'archived_user_73@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69d9-5a05-7264-b5316c0bea79', 'archived_user_74@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69de-7d72-7264-b5316c0c0487', 'archived_user_75@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69df-af04-73c6-958a017cecf9', 'archived_user_76@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69e7-1328-73c6-958a017d1fb3', 'archived_user_77@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69f7-9969-1b83-c92d32048c1c', 'archived_user_78@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69f7-9efe-1b83-c92d32048c89', 'archived_user_79@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-69fa-092e-1b83-c92d320498b4', 'archived_user_80@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6a0c-535b-1b83-c92d3204f9e1', 'archived_user_81@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6a0d-b4a5-1b83-c92d32050375', 'archived_user_82@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6a19-d9aa-48ca-75899e17e6ef', 'archived_user_83@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;
INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES ('00000000-6a19-db1f-48ca-75899e17e72e', 'archived_user_84@deleted.local', NULL, NULL, 'Archived', 'User', 'Nigeria', 'pending', NULL, NULL, FALSE, '{}'::jsonb, 'inactive', '2025-11-01T00:00:00.000Z', '2025-11-01T00:00:00.000Z')
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;

-- 3. Insert Wallets (315 wallets)
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6910-a803-9ee6-fac09d81f891', '00000000-6910-a803-9ee6-fac09d81f88f', 0, 'NGN', '2025-12-10T19:25:52.227Z', '2025-11-09T14:41:07.961Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6910-c05d-466d-6b359621dcd7', '00000000-6910-c05d-466d-6b359621dcd5', 0, 'NGN', '2025-11-16T04:48:02.743Z', '2025-11-09T16:25:01.870Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6910-c36c-466d-6b359621dd46', '00000000-6910-c36c-466d-6b359621dd44', 0, 'NGN', '2025-11-12T15:37:07.643Z', '2025-11-09T16:38:04.143Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6910-d47d-466d-6b359621dece', '00000000-6910-d47d-466d-6b359621decc', 0, 'NGN', NULL, '2025-11-09T17:50:53.921Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6911-af82-466d-6b359621dfc4', '00000000-6911-af82-466d-6b359621dfc2', 0, 'NGN', '2025-11-11T19:38:31.203Z', '2025-11-10T09:25:22.437Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6911-dd9b-efea-b41fdcf20566', '00000000-6911-dd9b-efea-b41fdcf20564', 0, 'NGN', '2025-11-10T17:11:15.313Z', '2025-11-10T12:42:03.916Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6912-c53b-13ca-4b97ddad1725', '00000000-6912-c53b-13ca-4b97ddad1723', 0, 'NGN', NULL, '2025-11-11T05:10:19.429Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6912-fc24-13ca-4b97ddad1756', '00000000-6912-fc24-13ca-4b97ddad1754', 0, 'NGN', '2026-03-17T22:39:17.992Z', '2025-11-11T09:04:36.923Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6913-26f6-13ca-4b97ddad1818', '00000000-6913-26f6-13ca-4b97ddad1816', 0, 'NGN', '2025-11-11T12:11:18.780Z', '2025-11-11T12:07:18.878Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6913-784f-7d85-25d517440281', '00000000-6913-784f-7d85-25d51744027f', 0, 'NGN', NULL, '2025-11-11T17:54:23.567Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6918-85ba-f8b7-f7435f4950f7', '00000000-6918-85ba-f8b7-f7435f4950f5', 0, 'NGN', NULL, '2025-11-15T13:52:58.382Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-691a-20bb-3f28-20aed7b2f97b', '00000000-691a-20bb-3f28-20aed7b2f979', 0, 'NGN', '2025-11-16T19:47:16.390Z', '2025-11-16T19:06:35.561Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-691a-2906-3f28-20aed7b2fa7d', '00000000-691a-2906-3f28-20aed7b2fa7b', 0, 'NGN', NULL, '2025-11-16T19:41:58.534Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-691c-8e9c-0905-272b76d063c9', '00000000-691c-8e9c-0905-272b76d063c7', 1089.6000000000004, 'NGN', '2026-07-13T11:12:29.491Z', '2025-11-18T15:19:56.159Z', '2026-07-13T11:12:29.491Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-691c-a0cf-60fe-50767ffc338a', '00000000-691c-a0cf-60fe-50767ffc3388', 0, 'NGN', NULL, '2025-11-18T16:37:35.073Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-691d-c0ce-60fe-50767ffc3445', '00000000-691d-c0ce-60fe-50767ffc3443', 0, 'NGN', NULL, '2025-11-19T13:06:22.112Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6920-ef1e-e195-e70de4cc3703', '00000000-6920-ef1e-e195-e70de4cc3701', 0, 'NGN', NULL, '2025-11-21T23:00:46.723Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6922-30ff-e195-e70de4cc397e', '00000000-6922-30ff-e195-e70de4cc397c', 0, 'NGN', NULL, '2025-11-22T21:54:07.974Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6925-e811-23d5-b6aac28734a3', '00000000-6925-e811-23d5-b6aac28734a1', 0, 'NGN', NULL, '2025-11-25T17:32:01.112Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6926-b1fd-23d5-b6aac2873709', '00000000-6926-b1fd-23d5-b6aac2873707', 0, 'NGN', '2025-12-01T18:52:02.612Z', '2025-11-26T07:53:33.955Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6926-cf42-23d5-b6aac2873805', '00000000-6926-cf42-23d5-b6aac2873803', 45, 'NGN', '2026-06-21T12:57:52.818Z', '2025-11-26T09:58:26.227Z', '2026-06-21T12:57:52.818Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6926-eb42-23d5-b6aac2873983', '00000000-6926-eb42-23d5-b6aac2873981', 0, 'NGN', NULL, '2025-11-26T11:57:54.636Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6926-f16b-23d5-b6aac28739b3', '00000000-6926-f16b-23d5-b6aac28739b1', 0, 'NGN', NULL, '2025-11-26T12:24:11.148Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6927-0e0b-4480-22289fe2d435', '00000000-6927-0e0b-4480-22289fe2d433', 0, 'NGN', NULL, '2025-11-26T14:26:19.295Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6927-20d9-4480-22289fe2d4df', '00000000-6927-20d9-4480-22289fe2d4dd', 49.71999999999997, 'NGN', '2026-06-13T21:43:57.410Z', '2025-11-26T15:46:33.481Z', '2026-06-13T21:43:57.410Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6927-2cb5-4480-22289fe2d573', '00000000-6927-2cb5-4480-22289fe2d571', 0, 'NGN', NULL, '2025-11-26T16:37:09.383Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6927-4b47-4480-22289fe2d5f0', '00000000-6927-4b47-4480-22289fe2d5ee', 0, 'NGN', '2026-01-19T09:53:33.234Z', '2025-11-26T18:47:35.637Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6927-8016-4480-22289fe2d7eb', '00000000-6927-8016-4480-22289fe2d7e9', 0, 'NGN', NULL, '2025-11-26T22:32:54.672Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6928-7cc6-4480-22289fe2db3a', '00000000-6928-7cc6-4480-22289fe2db38', 0, 'NGN', NULL, '2025-11-27T16:31:02.998Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6929-28ed-4480-22289fe2dd7c', '00000000-6929-28ed-4480-22289fe2dd7a', 58.14999999999998, 'NGN', '2026-07-08T11:31:07.939Z', '2025-11-28T04:45:33.564Z', '2026-07-08T11:31:07.939Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6929-29fa-4480-22289fe2dda0', '00000000-6929-29fa-4480-22289fe2dd9e', 0, 'NGN', '2026-01-05T14:51:10.806Z', '2025-11-28T04:50:02.889Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6929-ffb6-4480-22289fe2e0b8', '00000000-6929-ffb6-4480-22289fe2e0b6', 0, 'NGN', NULL, '2025-11-28T20:01:58.858Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-692a-0153-4480-22289fe2e12f', '00000000-692a-0153-4480-22289fe2e12d', 24, 'NGN', '2026-05-12T06:08:01.649Z', '2025-11-28T20:08:51.019Z', '2026-05-12T06:08:01.649Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-692a-8c09-4480-22289fe2e3e2', '00000000-692a-8c09-4480-22289fe2e3e0', 0, 'NGN', '2025-12-20T22:02:25.319Z', '2025-11-29T06:00:41.945Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-692b-3546-4480-22289fe2e733', '00000000-692b-3546-4480-22289fe2e731', 0, 'NGN', NULL, '2025-11-29T18:02:46.537Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-692b-d473-4480-22289fe2eac8', '00000000-692b-d473-4480-22289fe2eac6', 93, 'NGN', '2026-07-11T19:27:00.292Z', '2025-11-30T05:21:55.916Z', '2026-07-11T19:27:00.292Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-692c-9f8b-4480-22289fe2ee77', '00000000-692c-9f8b-4480-22289fe2ee75', 0, 'NGN', '2025-12-19T19:50:48.582Z', '2025-11-30T19:48:27.251Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-692d-7cf6-4480-22289fe2f096', '00000000-692d-7cf6-4480-22289fe2f094', 0, 'NGN', NULL, '2025-12-01T11:33:10.890Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-692e-a7d7-4480-22289fe2f5b7', '00000000-692e-a7d7-4480-22289fe2f5b5', 0, 'NGN', NULL, '2025-12-02T08:48:23.702Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6934-9585-c7bf-7630650d3000', '00000000-6934-9585-c7bf-7630650d2ffe', 0, 'NGN', NULL, '2025-12-06T20:43:49.987Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6935-d3ec-eeea-3fc22a3b5b48', '00000000-6935-d3ec-eeea-3fc22a3b5b46', 63.700000000000045, 'NGN', '2026-07-11T19:44:52.580Z', '2025-12-07T19:22:20.284Z', '2026-07-11T19:44:52.580Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6935-d8aa-de74-fefd3f965892', '00000000-6935-d8aa-de74-fefd3f965890', 3.7000000000000455, 'NGN', '2026-06-14T19:41:18.134Z', '2025-12-07T19:42:34.891Z', '2026-06-14T19:41:18.134Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6938-3b54-de74-fefd3f965c10', '00000000-6938-3b54-de74-fefd3f965c0e', 23, 'NGN', '2026-07-11T21:30:34.611Z', '2025-12-09T15:08:04.333Z', '2026-07-11T21:30:34.611Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6939-df98-eeea-3fc22a3b624a', '00000000-6939-df98-eeea-3fc22a3b6248', 0, 'NGN', NULL, '2025-12-10T21:01:12.062Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6939-e4d9-de74-fefd3f965fc5', '00000000-6939-e4d9-de74-fefd3f965fc3', 0, 'NGN', NULL, '2025-12-10T21:23:37.932Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6939-e5f9-eeea-3fc22a3b62c5', '00000000-6939-e5f9-eeea-3fc22a3b62c3', 0, 'NGN', '2025-12-23T19:13:58.509Z', '2025-12-10T21:28:25.355Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-693b-3e83-de74-fefd3f9661e9', '00000000-693b-3e83-de74-fefd3f9661e7', 0, 'NGN', NULL, '2025-12-11T21:58:27.246Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6940-794d-de74-fefd3f966b33', '00000000-6940-794d-de74-fefd3f966b31', 0, 'NGN', NULL, '2025-12-15T21:10:37.643Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6941-b7dd-eeea-3fc22a3b6fcf', '00000000-6941-b7dd-eeea-3fc22a3b6fcd', 0, 'NGN', NULL, '2025-12-16T19:49:49.962Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6942-3820-eeea-3fc22a3b7094', '00000000-6942-3820-eeea-3fc22a3b7092', 0, 'NGN', '2025-12-17T05:00:35.392Z', '2025-12-17T04:57:04.161Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6942-caa6-de74-fefd3f966e93', '00000000-6942-caa6-de74-fefd3f966e91', 0, 'NGN', NULL, '2025-12-17T15:22:14.448Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6944-3e1b-eeea-3fc22a3b7424', '00000000-6944-3e1b-eeea-3fc22a3b7422', 12.5, 'NGN', '2026-06-17T10:46:52.591Z', '2025-12-18T17:47:07.091Z', '2026-06-17T10:46:52.591Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6945-8e98-de74-fefd3f9672ea', '00000000-6945-8e98-de74-fefd3f9672e8', 0, 'NGN', NULL, '2025-12-19T17:42:48.572Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6946-f4c9-de74-fefd3f96766a', '00000000-6946-f4c9-de74-fefd3f967668', 0, 'NGN', '2025-12-21T11:28:42.328Z', '2025-12-20T19:11:05.816Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6947-bc81-eeea-3fc22a3b7aa1', '00000000-6947-bc81-eeea-3fc22a3b7a9f', 0, 'NGN', '2026-01-25T19:28:48.326Z', '2025-12-21T09:23:13.751Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6949-1bcf-de74-fefd3f9679f1', '00000000-6949-1bcf-de74-fefd3f9679ef', 0, 'NGN', '2026-03-17T03:30:14.805Z', '2025-12-22T10:22:07.498Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6949-6b8b-eeea-3fc22a3b7dff', '00000000-6949-6b8b-eeea-3fc22a3b7dfd', 0.8999999999999773, 'NGN', '2026-04-22T17:24:13.468Z', '2025-12-22T16:02:19.691Z', '2026-04-22T17:24:13.468Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-694a-a1b0-de74-fefd3f967d9d', '00000000-694a-a1b0-de74-fefd3f967d9b', 0, 'NGN', NULL, '2025-12-23T14:05:36.214Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-694a-a30e-de74-fefd3f967dcd', '00000000-694a-a30e-de74-fefd3f967dcb', 0, 'NGN', NULL, '2025-12-23T14:11:26.785Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-694a-a3fb-de74-fefd3f967de9', '00000000-694a-a3fb-de74-fefd3f967de7', 78.30000000000018, 'NGN', '2026-05-13T20:53:08.595Z', '2025-12-23T14:15:23.033Z', '2026-05-13T20:53:08.595Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-694a-ebec-de74-fefd3f967e85', '00000000-694a-ebec-de74-fefd3f967e83', 15, 'NGN', '2026-06-22T21:20:42.696Z', '2025-12-23T19:22:20.616Z', '2026-06-22T21:20:42.696Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-694c-ee2a-de74-fefd3f9682dd', '00000000-694c-ee2a-de74-fefd3f9682db', 0, 'NGN', NULL, '2025-12-25T07:56:26.205Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-694d-6e9d-eeea-3fc22a3b87fa', '00000000-694d-6e9d-eeea-3fc22a3b87f8', 0, 'NGN', NULL, '2025-12-25T17:04:29.534Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6951-0fc5-eeea-3fc22a3b8fd3', '00000000-6951-0fc5-eeea-3fc22a3b8fd1', 1956.5, 'NGN', '2026-07-13T13:52:40.738Z', '2025-12-28T11:08:53.391Z', '2026-07-13T13:52:40.738Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6952-c4b3-de74-fefd3f9691d1', '00000000-6952-c4b3-de74-fefd3f9691cf', 0, 'NGN', '2026-01-12T14:17:50.786Z', '2025-12-29T18:13:07.815Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6952-d1b5-eeea-3fc22a3b9523', '00000000-6952-d1b5-eeea-3fc22a3b9521', 0, 'NGN', NULL, '2025-12-29T19:08:37.840Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6953-8d81-eeea-3fc22a3b9687', '00000000-6953-8d81-eeea-3fc22a3b9685', 0, 'NGN', NULL, '2025-12-30T08:29:53.896Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6953-d3b2-de74-fefd3f969451', '00000000-6953-d3b2-de74-fefd3f96944f', 73.90000000000009, 'NGN', '2026-06-25T23:14:53.656Z', '2025-12-30T13:29:22.592Z', '2026-06-25T23:14:53.656Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6954-417c-de74-fefd3f96961f', '00000000-6954-417c-de74-fefd3f96961d', 178, 'NGN', '2026-06-30T21:26:51.584Z', '2025-12-30T21:17:48.480Z', '2026-06-30T21:26:51.584Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6956-bf2f-6221-f213880fa477', '00000000-6956-bf2f-6221-f213880fa475', 90, 'NGN', '2026-07-12T15:07:19.963Z', '2026-01-01T18:38:39.889Z', '2026-07-12T15:07:19.963Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6958-f15d-6221-f213880faa27', '00000000-6958-f15d-6221-f213880faa25', 0, 'NGN', NULL, '2026-01-03T10:37:17.656Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6959-80b1-8b59-d9ec21030036', '00000000-6959-80b1-8b59-d9ec21030034', 0, 'NGN', '2026-02-22T13:18:43.904Z', '2026-01-03T20:48:49.262Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6959-9a4e-8b59-d9ec210300dd', '00000000-6959-9a4e-8b59-d9ec210300db', 0, 'NGN', NULL, '2026-01-03T22:38:06.078Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6959-9d05-6221-f213880fad4b', '00000000-6959-9d05-6221-f213880fad49', 0, 'NGN', NULL, '2026-01-03T22:49:41.722Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-695a-1b6b-8b59-d9ec21030167', '00000000-695a-1b6b-8b59-d9ec21030165', 0, 'NGN', '2026-01-04T07:54:20.793Z', '2026-01-04T07:48:59.743Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-695a-4f7d-8b59-d9ec2103020c', '00000000-695a-4f7d-8b59-d9ec2103020a', 0, 'NGN', '2026-03-03T10:52:57.597Z', '2026-01-04T11:31:09.658Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-695a-6b8f-8b59-d9ec21030256', '00000000-695a-6b8f-8b59-d9ec21030254', 158.0999999999999, 'NGN', '2026-07-13T09:50:37.368Z', '2026-01-04T13:30:55.695Z', '2026-07-13T09:50:37.368Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-695a-70ab-6221-f213880faef4', '00000000-695a-70ab-6221-f213880faef2', 0, 'NGN', '2026-01-04T22:22:39.127Z', '2026-01-04T13:52:43.407Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-695a-77d5-8b59-d9ec210302e7', '00000000-695a-77d5-8b59-d9ec210302e5', 0, 'NGN', NULL, '2026-01-04T14:23:17.356Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-695a-7977-8b59-d9ec21030303', '00000000-695a-7977-8b59-d9ec21030301', 0, 'NGN', NULL, '2026-01-04T14:30:15.150Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-695a-7fe8-8b59-d9ec21030324', '00000000-695a-7fe8-8b59-d9ec21030322', 0, 'NGN', '2026-01-15T16:39:18.199Z', '2026-01-04T14:57:44.349Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-695a-8128-6221-f213880faf5f', '00000000-695a-8128-6221-f213880faf5d', 36.139999999999986, 'NGN', '2026-05-12T16:49:15.553Z', '2026-01-04T15:03:04.287Z', '2026-05-12T16:49:15.553Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-695a-8463-6221-f213880faf95', '00000000-695a-8463-6221-f213880faf93', 0, 'NGN', '2026-01-26T08:48:29.281Z', '2026-01-04T15:16:51.459Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-695a-8521-8b59-d9ec2103036b', '00000000-695a-8521-8b59-d9ec21030369', 0, 'NGN', '2026-04-12T12:25:10.569Z', '2026-01-04T15:20:01.265Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-695a-8dc6-8b59-d9ec210303cf', '00000000-695a-8dc6-8b59-d9ec210303cd', 0, 'NGN', NULL, '2026-01-04T15:56:54.891Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-695a-9017-6221-f213880fb014', '00000000-695a-9017-6221-f213880fb012', 0, 'NGN', NULL, '2026-01-04T16:06:47.640Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-695a-b29e-6221-f213880fb0de', '00000000-695a-b29e-6221-f213880fb0dc', 0, 'NGN', NULL, '2026-01-04T18:34:06.803Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-695a-d1be-8b59-d9ec2103062b', '00000000-695a-d1be-8b59-d9ec21030629', 0, 'NGN', NULL, '2026-01-04T20:46:54.046Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-695d-85fb-6221-f213880fbb45', '00000000-695d-85fb-6221-f213880fbb43', 0, 'NGN', NULL, '2026-01-06T22:00:27.559Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6965-0176-6221-f213880fcf84', '00000000-6965-0176-6221-f213880fcf82', 0, 'NGN', NULL, '2026-01-12T14:13:10.543Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6966-7869-6221-f213880fd2b2', '00000000-6966-7869-6221-f213880fd2b0', 0, 'NGN', '2026-03-20T11:34:24.479Z', '2026-01-13T16:52:57.487Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6967-6564-8b59-d9ec2103281b', '00000000-6967-6564-8b59-d9ec21032819', 0, 'NGN', '2026-04-01T14:51:01.758Z', '2026-01-14T09:44:04.016Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6967-9387-f32c-57d5530d77bb', '00000000-6967-9387-f32c-57d5530d77b9', 0, 'NGN', NULL, '2026-01-14T13:00:55.689Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6967-97be-f32c-57d5530d7835', '00000000-6967-97be-f32c-57d5530d7833', 0, 'NGN', NULL, '2026-01-14T13:18:54.264Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-696a-0e94-27eb-059addcfcf26', '00000000-696a-0e94-27eb-059addcfcf24', 0, 'NGN', NULL, '2026-01-16T10:10:28.248Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-696a-420d-e751-5e1550bdf85d', '00000000-696a-420d-e751-5e1550bdf85b', 0, 'NGN', NULL, '2026-01-16T13:50:05.835Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-696a-6089-e751-5e1550bdf8ea', '00000000-696a-6089-e751-5e1550bdf8e8', 0, 'NGN', NULL, '2026-01-16T16:00:09.379Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-696b-f26a-27eb-059addcfd74e', '00000000-696b-f26a-27eb-059addcfd74c', 0, 'NGN', '2026-02-11T22:22:36.835Z', '2026-01-17T20:34:50.991Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6970-ef6d-27eb-059addcfe138', '00000000-6970-ef6d-27eb-059addcfe136', 0, 'NGN', NULL, '2026-01-21T15:23:25.179Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6972-2d54-e751-5e1550be0b11', '00000000-6972-2d54-e751-5e1550be0b0f', 199.74999999999977, 'NGN', '2026-07-12T20:29:55.172Z', '2026-01-22T13:59:48.793Z', '2026-07-12T20:29:55.172Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6974-d0b4-27eb-059addcfeb54', '00000000-6974-d0b4-27eb-059addcfeb52', 0, 'NGN', NULL, '2026-01-24T14:01:24.537Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6974-d1b5-27eb-059addcfeb88', '00000000-6974-d1b5-27eb-059addcfeb86', 0, 'NGN', NULL, '2026-01-24T14:05:41.951Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6975-9f7f-27eb-059addcfedc0', '00000000-6975-9f7f-27eb-059addcfedbe', 0, 'NGN', NULL, '2026-01-25T04:43:43.765Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6978-bb39-e751-5e1550be1f48', '00000000-6978-bb39-e751-5e1550be1f46', 6.299999999999997, 'NGN', '2026-05-05T18:43:32.776Z', '2026-01-27T13:18:49.469Z', '2026-05-05T18:43:32.776Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-697c-cf49-e751-5e1550be2840', '00000000-697c-cf49-e751-5e1550be283e', 0, 'NGN', NULL, '2026-01-30T15:33:29.568Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-697c-d2d9-e751-5e1550be2854', '00000000-697c-d2d9-e751-5e1550be2852', 0, 'NGN', NULL, '2026-01-30T15:48:41.769Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-697c-d46d-27eb-059addd00163', '00000000-697c-d46d-27eb-059addd00161', 0, 'NGN', NULL, '2026-01-30T15:55:25.018Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-697c-e02b-27eb-059addd001a1', '00000000-697c-e02b-27eb-059addd0019f', 0, 'NGN', '2026-02-07T09:49:32.010Z', '2026-01-30T16:45:31.476Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-697c-e21d-e751-5e1550be28b3', '00000000-697c-e21d-e751-5e1550be28b1', 0, 'NGN', NULL, '2026-01-30T16:53:49.161Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-697c-e30e-e751-5e1550be28d3', '00000000-697c-e30e-e751-5e1550be28d1', 0, 'NGN', NULL, '2026-01-30T16:57:50.289Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-697c-ec59-27eb-059addd0021b', '00000000-697c-ec59-27eb-059addd00219', 0, 'NGN', NULL, '2026-01-30T17:37:29.917Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-697c-f015-27eb-059addd0026b', '00000000-697c-f015-27eb-059addd00269', 0, 'NGN', NULL, '2026-01-30T17:53:25.989Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-697d-2dfa-e751-5e1550be2b7a', '00000000-697d-2dfa-e751-5e1550be2b78', 0, 'NGN', NULL, '2026-01-30T22:17:30.765Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-697d-b147-e751-5e1550be2c2f', '00000000-697d-b147-e751-5e1550be2c2d', 0, 'NGN', NULL, '2026-01-31T07:37:43.788Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-697d-ecce-27eb-059addd00690', '00000000-697d-ecce-27eb-059addd0068e', 0, 'NGN', NULL, '2026-01-31T11:51:42.658Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-697f-0bdb-e751-5e1550be352b', '00000000-697f-0bdb-e751-5e1550be3529', 2.159999999999968, 'NGN', '2026-05-19T18:40:18.916Z', '2026-02-01T08:16:27.769Z', '2026-05-19T18:40:18.916Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-697f-153e-e751-5e1550be354c', '00000000-697f-153e-e751-5e1550be354a', 0, 'NGN', '2026-03-10T19:38:56.612Z', '2026-02-01T08:56:30.341Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-697f-87da-27eb-059addd01049', '00000000-697f-87da-27eb-059addd01047', 0, 'NGN', '2026-02-03T00:22:13.922Z', '2026-02-01T17:05:30.522Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-697f-8b71-e751-5e1550be36f9', '00000000-697f-8b71-e751-5e1550be36f7', 0, 'NGN', NULL, '2026-02-01T17:20:49.014Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-697f-9bc4-e751-5e1550be3756', '00000000-697f-9bc4-e751-5e1550be3754', 0, 'NGN', NULL, '2026-02-01T18:30:28.584Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-697f-a2e2-27eb-059addd010d3', '00000000-697f-a2e2-27eb-059addd010d1', 0, 'NGN', '2026-03-09T14:18:05.276Z', '2026-02-01T19:00:50.785Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6980-599f-e751-5e1550be3943', '00000000-6980-599f-e751-5e1550be3941', 0, 'NGN', NULL, '2026-02-02T08:00:31.109Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6980-8f60-e751-5e1550be3a63', '00000000-6980-8f60-e751-5e1550be3a61', 0, 'NGN', '2026-03-12T13:45:59.718Z', '2026-02-02T11:49:52.324Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6980-911d-e751-5e1550be3a75', '00000000-6980-911d-e751-5e1550be3a73', 0, 'NGN', NULL, '2026-02-02T11:57:17.041Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6980-93a3-27eb-059addd01406', '00000000-6980-93a3-27eb-059addd01404', 0, 'NGN', NULL, '2026-02-02T12:08:03.235Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6980-9ff7-e751-5e1550be3adb', '00000000-6980-9ff7-e751-5e1550be3ad9', 0, 'NGN', NULL, '2026-02-02T13:00:39.769Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6980-cdf6-e751-5e1550be3bdb', '00000000-6980-cdf6-e751-5e1550be3bd9', 0, 'NGN', NULL, '2026-02-02T16:16:54.140Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6980-d093-27eb-059addd01568', '00000000-6980-d093-27eb-059addd01566', 0, 'NGN', NULL, '2026-02-02T16:28:03.830Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6981-f165-e751-5e1550be408c', '00000000-6981-f165-e751-5e1550be408a', 0, 'NGN', NULL, '2026-02-03T13:00:21.681Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6982-1842-e751-5e1550be4101', '00000000-6982-1842-e751-5e1550be40ff', 0, 'NGN', NULL, '2026-02-03T15:46:10.148Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6982-273c-e751-5e1550be416c', '00000000-6982-273c-e751-5e1550be416a', 0, 'NGN', NULL, '2026-02-03T16:50:04.422Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6982-55f2-e751-5e1550be4222', '00000000-6982-55f2-e751-5e1550be4220', 0, 'NGN', NULL, '2026-02-03T20:09:22.252Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6982-d6c5-e751-5e1550be4334', '00000000-6982-d6c5-e751-5e1550be4332', 0, 'NGN', NULL, '2026-02-04T05:19:01.507Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6983-7550-27eb-059addd01ec3', '00000000-6983-7550-27eb-059addd01ec1', 0, 'NGN', NULL, '2026-02-04T16:35:28.093Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6983-7fc2-27eb-059addd01f0f', '00000000-6983-7fc2-27eb-059addd01f0d', 0, 'NGN', NULL, '2026-02-04T17:20:02.701Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6983-af9f-27eb-059addd01feb', '00000000-6983-af9f-27eb-059addd01fe9', 0, 'NGN', NULL, '2026-02-04T20:44:15.722Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6983-afb5-e751-5e1550be4618', '00000000-6983-afb5-e751-5e1550be4616', 0, 'NGN', NULL, '2026-02-04T20:44:37.172Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6983-b4bc-e751-5e1550be465d', '00000000-6983-b4bc-e751-5e1550be465b', 611, 'NGN', '2026-06-23T10:34:37.592Z', '2026-02-04T21:06:04.652Z', '2026-06-23T10:34:37.592Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6983-ba1b-e751-5e1550be46a4', '00000000-6983-ba1b-e751-5e1550be46a2', 0, 'NGN', '2026-02-15T09:29:47.760Z', '2026-02-04T21:28:59.735Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6983-ba45-27eb-059addd02086', '00000000-6983-ba45-27eb-059addd02084', 0, 'NGN', NULL, '2026-02-04T21:29:41.106Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6983-c516-e751-5e1550be4707', '00000000-6983-c516-e751-5e1550be4705', 0, 'NGN', NULL, '2026-02-04T22:15:50.313Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6983-cf08-27eb-059addd0212c', '00000000-6983-cf08-27eb-059addd0212a', 0, 'NGN', NULL, '2026-02-04T22:58:16.717Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6983-d01f-e751-5e1550be47a3', '00000000-6983-d01f-e751-5e1550be47a1', 0, 'NGN', NULL, '2026-02-04T23:02:55.495Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6984-332d-27eb-059addd022f5', '00000000-6984-332d-27eb-059addd022f3', 0, 'NGN', NULL, '2026-02-05T06:05:33.359Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6984-61e5-27eb-059addd02344', '00000000-6984-61e5-27eb-059addd02342', 0, 'NGN', NULL, '2026-02-05T09:24:53.157Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6984-6d8c-27eb-059addd02417', '00000000-6984-6d8c-27eb-059addd02415', 0, 'NGN', NULL, '2026-02-05T10:14:36.439Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6984-6e11-e751-5e1550be49e8', '00000000-6984-6e11-e751-5e1550be49e6', 0, 'NGN', NULL, '2026-02-05T10:16:49.081Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6984-7921-e751-5e1550be4a1f', '00000000-6984-7921-e751-5e1550be4a1d', 0, 'NGN', '2026-04-20T23:00:10.488Z', '2026-02-05T11:04:01.480Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6984-8620-e751-5e1550be4a78', '00000000-6984-8620-e751-5e1550be4a76', 367.2999999999979, 'NGN', '2026-05-11T13:57:17.978Z', '2026-02-05T11:59:28.635Z', '2026-05-11T13:57:17.978Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6984-86a4-e751-5e1550be4a94', '00000000-6984-86a4-e751-5e1550be4a92', 0, 'NGN', NULL, '2026-02-05T12:01:40.991Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6984-8b80-27eb-059addd024f4', '00000000-6984-8b80-27eb-059addd024f2', 0, 'NGN', NULL, '2026-02-05T12:22:24.544Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6984-9ad7-e751-5e1550be4b09', '00000000-6984-9ad7-e751-5e1550be4b07', 0, 'NGN', NULL, '2026-02-05T13:27:51.929Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6984-a4c0-e751-5e1550be4b50', '00000000-6984-a4c0-e751-5e1550be4b4e', 0, 'NGN', NULL, '2026-02-05T14:10:08.504Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6984-ab78-e751-5e1550be4ba2', '00000000-6984-ab78-e751-5e1550be4ba0', 0, 'NGN', NULL, '2026-02-05T14:38:48.068Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6984-abac-27eb-059addd025c9', '00000000-6984-abac-27eb-059addd025c7', 16.19999999999999, 'NGN', '2026-06-21T11:25:25.801Z', '2026-02-05T14:39:40.433Z', '2026-06-21T11:25:25.801Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6984-b1f3-e751-5e1550be4bd7', '00000000-6984-b1f3-e751-5e1550be4bd5', 0, 'NGN', '2026-04-08T09:57:39.187Z', '2026-02-05T15:06:27.847Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6984-b752-e751-5e1550be4c43', '00000000-6984-b752-e751-5e1550be4c41', 0, 'NGN', NULL, '2026-02-05T15:29:22.444Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6984-b76e-27eb-059addd0265c', '00000000-6984-b76e-27eb-059addd0265a', 0, 'NGN', NULL, '2026-02-05T15:29:50.384Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6985-98f1-e751-5e1550be5113', '00000000-6985-98f1-e751-5e1550be5111', 0, 'NGN', NULL, '2026-02-06T07:32:01.450Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6986-031e-e751-5e1550be52b7', '00000000-6986-031e-e751-5e1550be52b5', 0, 'NGN', NULL, '2026-02-06T15:05:02.612Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6986-44ec-27eb-059addd02daa', '00000000-6986-44ec-27eb-059addd02da8', 0, 'NGN', NULL, '2026-02-06T19:45:48.923Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6986-4d0c-27eb-059addd02df1', '00000000-6986-4d0c-27eb-059addd02def', 20.149999999999977, 'NGN', '2026-07-12T18:41:50.521Z', '2026-02-06T20:20:28.405Z', '2026-07-12T18:41:50.521Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6986-e336-e751-5e1550be5717', '00000000-6986-e336-e751-5e1550be5715', 0, 'NGN', NULL, '2026-02-07T07:01:10.895Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6987-0654-27eb-059addd031ec', '00000000-6987-0654-27eb-059addd031ea', 0, 'NGN', '2026-02-07T12:47:37.734Z', '2026-02-07T09:31:00.557Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6987-0fd2-e751-5e1550be590a', '00000000-6987-0fd2-e751-5e1550be5908', 0, 'NGN', NULL, '2026-02-07T10:11:30.649Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6988-4314-27eb-059addd03761', '00000000-6988-4314-27eb-059addd0375f', 0, 'NGN', NULL, '2026-02-08T08:02:28.146Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6988-79e3-27eb-059addd03924', '00000000-6988-79e3-27eb-059addd03922', 0, 'NGN', NULL, '2026-02-08T11:56:19.358Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6989-d5fc-30d8-238dc98ae6a7', '00000000-6989-d5fc-30d8-238dc98ae6a5', 0, 'NGN', NULL, '2026-02-09T12:41:32.773Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6989-fd73-494b-caf1612607b3', '00000000-6989-fd73-494b-caf1612607b1', 0, 'NGN', NULL, '2026-02-09T15:29:55.714Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-698a-041b-19f2-0ddc42aae2fc', '00000000-698a-041b-19f2-0ddc42aae2fa', 0, 'NGN', NULL, '2026-02-09T15:58:19.972Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-698a-059c-494b-caf161260893', '00000000-698a-059c-494b-caf161260891', 0, 'NGN', NULL, '2026-02-09T16:04:44.885Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-698a-05f7-19f2-0ddc42aae32e', '00000000-698a-05f7-19f2-0ddc42aae32c', 0, 'NGN', NULL, '2026-02-09T16:06:15.800Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-698a-cd4c-19f2-0ddc42aae711', '00000000-698a-cd4c-19f2-0ddc42aae70f', 0, 'NGN', NULL, '2026-02-10T06:16:44.618Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-698a-e80e-494b-caf161260ce1', '00000000-698a-e80e-494b-caf161260cdf', 0, 'NGN', '2026-02-12T15:23:51.106Z', '2026-02-10T08:10:54.903Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-698a-eaf0-494b-caf161260d15', '00000000-698a-eaf0-494b-caf161260d13', 0, 'NGN', NULL, '2026-02-10T08:23:12.224Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-698a-f0a2-19f2-0ddc42aae7b8', '00000000-698a-f0a2-19f2-0ddc42aae7b6', 0, 'NGN', '2026-03-01T18:14:00.484Z', '2026-02-10T08:47:30.580Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-698a-f57a-494b-caf161260dba', '00000000-698a-f57a-494b-caf161260db8', 0, 'NGN', '2026-03-07T09:30:39.232Z', '2026-02-10T09:08:10.109Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-698b-072e-19f2-0ddc42aae8db', '00000000-698b-072e-19f2-0ddc42aae8d9', 0, 'NGN', NULL, '2026-02-10T10:23:42.525Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-698b-0e6e-494b-caf161260e94', '00000000-698b-0e6e-494b-caf161260e92', 0, 'NGN', NULL, '2026-02-10T10:54:38.602Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-698b-0ee4-494b-caf161260ea5', '00000000-698b-0ee4-494b-caf161260ea3', 10, 'NGN', '2026-05-21T11:38:41.175Z', '2026-02-10T10:56:36.245Z', '2026-05-21T11:38:41.175Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-698b-1358-19f2-0ddc42aae930', '00000000-698b-1358-19f2-0ddc42aae92e', 297, 'NGN', '2026-05-11T07:42:29.701Z', '2026-02-10T11:15:36.922Z', '2026-05-11T07:42:29.701Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-698b-1694-494b-caf161260eea', '00000000-698b-1694-494b-caf161260ee8', 0, 'NGN', NULL, '2026-02-10T11:29:24.272Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-698b-187f-494b-caf161260efa', '00000000-698b-187f-494b-caf161260ef8', 0, 'NGN', NULL, '2026-02-10T11:37:35.099Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-698b-212f-494b-caf161260f55', '00000000-698b-212f-494b-caf161260f53', 0, 'NGN', NULL, '2026-02-10T12:14:39.813Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-698b-25ec-19f2-0ddc42aae9fa', '00000000-698b-25ec-19f2-0ddc42aae9f8', 0, 'NGN', '2026-02-16T14:30:44.877Z', '2026-02-10T12:34:52.688Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-698b-323d-494b-caf1612610da', '00000000-698b-323d-494b-caf1612610d8', 0, 'NGN', NULL, '2026-02-10T13:27:25.818Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-698b-3417-494b-caf1612610fb', '00000000-698b-3417-494b-caf1612610f9', 0, 'NGN', NULL, '2026-02-10T13:35:19.074Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-698b-37c0-19f2-0ddc42aaeaf9', '00000000-698b-37c0-19f2-0ddc42aaeaf7', 45.69999999999982, 'NGN', '2026-06-21T18:36:33.344Z', '2026-02-10T13:50:56.193Z', '2026-06-21T18:36:33.344Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-698b-3c4f-494b-caf16126114f', '00000000-698b-3c4f-494b-caf16126114d', 0, 'NGN', '2026-02-12T21:39:01.885Z', '2026-02-10T14:10:23.268Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-698b-3dd9-19f2-0ddc42aaeb36', '00000000-698b-3dd9-19f2-0ddc42aaeb34', 0, 'NGN', '2026-02-11T12:32:53.869Z', '2026-02-10T14:16:57.296Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-698b-75da-19f2-0ddc42aaebe9', '00000000-698b-75da-19f2-0ddc42aaebe7', 0, 'NGN', NULL, '2026-02-10T18:15:54.687Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-698c-46f7-19f2-0ddc42aaef73', '00000000-698c-46f7-19f2-0ddc42aaef71', 0, 'NGN', NULL, '2026-02-11T09:08:07.347Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-698c-68c2-494b-caf16126164c', '00000000-698c-68c2-494b-caf16126164a', 0, 'NGN', NULL, '2026-02-11T11:32:18.970Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-698c-a53e-494b-caf161261818', '00000000-698c-a53e-494b-caf161261816', 0, 'NGN', NULL, '2026-02-11T15:50:22.348Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-698c-f4d6-19f2-0ddc42aaf479', '00000000-698c-f4d6-19f2-0ddc42aaf477', 0, 'NGN', NULL, '2026-02-11T21:29:58.414Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-698d-9d99-19f2-0ddc42aaf674', '00000000-698d-9d99-19f2-0ddc42aaf672', 0, 'NGN', NULL, '2026-02-12T09:30:01.777Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-698e-d892-494b-caf1612621bf', '00000000-698e-d892-494b-caf1612621bd', 0, 'NGN', NULL, '2026-02-13T07:53:54.598Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6990-462c-494b-caf1612627e4', '00000000-6990-462c-494b-caf1612627e2', 0, 'NGN', NULL, '2026-02-14T09:53:48.709Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6990-bb84-19f2-0ddc42ab0268', '00000000-6990-bb84-19f2-0ddc42ab0266', 0, 'NGN', NULL, '2026-02-14T18:14:28.160Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6990-c5fe-19f2-0ddc42ab030c', '00000000-6990-c5fe-19f2-0ddc42ab030a', 0, 'NGN', NULL, '2026-02-14T18:59:10.659Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6994-083e-19f2-0ddc42ab0efd', '00000000-6994-083e-19f2-0ddc42ab0efb', 45, 'NGN', '2026-05-14T06:36:00.099Z', '2026-02-17T06:18:38.079Z', '2026-05-14T06:36:00.099Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6995-4595-19f2-0ddc42ab144e', '00000000-6995-4595-19f2-0ddc42ab144c', 0, 'NGN', NULL, '2026-02-18T04:52:37.742Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6995-c1a6-494b-caf161263c9d', '00000000-6995-c1a6-494b-caf161263c9b', 0, 'NGN', NULL, '2026-02-18T13:41:58.728Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6995-c806-494b-caf161263cbd', '00000000-6995-c806-494b-caf161263cbb', 47, 'NGN', '2026-05-02T21:43:01.614Z', '2026-02-18T14:09:10.980Z', '2026-05-02T21:43:01.614Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6998-ba4d-19f2-0ddc42ab1fd6', '00000000-6998-ba4d-19f2-0ddc42ab1fd4', 0, 'NGN', '2026-02-27T21:21:42.789Z', '2026-02-20T19:47:25.133Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6999-748d-19f2-0ddc42ab2222', '00000000-6999-748d-19f2-0ddc42ab2220', 0, 'NGN', '2026-02-21T09:58:32.161Z', '2026-02-21T09:02:05.217Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6999-e327-19f2-0ddc42ab268b', '00000000-6999-e327-19f2-0ddc42ab2689', 12.699999999999818, 'NGN', '2026-07-07T19:57:47.857Z', '2026-02-21T16:53:59.780Z', '2026-07-07T19:57:47.857Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-699a-8a48-19f2-0ddc42ab2912', '00000000-699a-8a48-19f2-0ddc42ab2910', 0, 'NGN', NULL, '2026-02-22T04:47:04.844Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-699c-1927-494b-caf161265757', '00000000-699c-1927-494b-caf161265755', 0, 'NGN', NULL, '2026-02-23T09:08:55.803Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69a0-b9b6-4141-dbfa7e09a47d', '00000000-69a0-b9b6-4141-dbfa7e09a47b', 0, 'NGN', '2026-03-27T19:39:01.389Z', '2026-02-26T21:23:02.148Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69a3-6029-2a6b-f5607f362315', '00000000-69a3-6029-2a6b-f5607f362313', 0, 'NGN', NULL, '2026-02-28T21:37:45.693Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69a5-94ec-2a6b-f5607f3632e2', '00000000-69a5-94ec-2a6b-f5607f3632e0', 0, 'NGN', NULL, '2026-03-02T13:47:24.661Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69a5-c6a3-2a6b-f5607f3634f7', '00000000-69a5-c6a3-2a6b-f5607f3634f5', 170.89999999999998, 'NGN', '2026-05-15T08:14:10.667Z', '2026-03-02T17:19:31.955Z', '2026-05-15T08:14:10.667Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69a7-15b5-17bc-f54fb1169e9c', '00000000-69a7-15b5-17bc-f54fb1169e9a', 0, 'NGN', NULL, '2026-03-03T17:09:09.315Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69a9-4f06-17bc-f54fb116af64', '00000000-69a9-4f06-17bc-f54fb116af62', 0, 'NGN', NULL, '2026-03-05T09:38:14.492Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69a9-9f73-17bc-f54fb116b274', '00000000-69a9-9f73-17bc-f54fb116b272', 0, 'NGN', NULL, '2026-03-05T15:21:23.272Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69aa-a70e-17bc-f54fb116bc4e', '00000000-69aa-a70e-17bc-f54fb116bc4c', 0, 'NGN', '2026-03-08T20:06:48.863Z', '2026-03-06T10:06:06.672Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69aa-bd44-17bc-f54fb116bf1a', '00000000-69aa-bd44-17bc-f54fb116bf18', 235, 'NGN', '2026-05-09T10:36:29.423Z', '2026-03-06T11:40:52.551Z', '2026-05-09T10:36:29.423Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69b5-480e-7264-b5316c0b0475', '00000000-69b5-480e-7264-b5316c0b0473', 0, 'NGN', NULL, '2026-03-14T11:35:42.389Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69b6-72da-7264-b5316c0b0b17', '00000000-69b6-72da-7264-b5316c0b0b15', 0, 'NGN', NULL, '2026-03-15T08:50:34.611Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69b6-757d-7264-b5316c0b0b7d', '00000000-69b6-757d-7264-b5316c0b0b7b', 0, 'NGN', NULL, '2026-03-15T09:01:49.659Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69b6-9035-7264-b5316c0b0cde', '00000000-69b6-9035-7264-b5316c0b0cdc', 0, 'NGN', NULL, '2026-03-15T10:55:49.017Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69bd-b5ca-7264-b5316c0b406a', '00000000-69bd-b5ca-7264-b5316c0b4068', 0, 'NGN', '2026-03-24T20:09:50.555Z', '2026-03-20T21:02:02.576Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69c2-da31-7264-b5316c0b6a8a', '00000000-69c2-da31-7264-b5316c0b6a88', 0, 'NGN', NULL, '2026-03-24T18:38:41.299Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69c3-0883-7264-b5316c0b6ef8', '00000000-69c3-0883-7264-b5316c0b6ef6', 0, 'NGN', NULL, '2026-03-24T21:56:19.526Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69c3-8669-7264-b5316c0b6fce', '00000000-69c3-8669-7264-b5316c0b6fcc', 49.5, 'NGN', '2026-04-29T21:32:30.983Z', '2026-03-25T06:53:29.899Z', '2026-04-29T21:32:30.983Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69c8-b1c1-7264-b5316c0b8b46', '00000000-69c8-b1c1-7264-b5316c0b8b44', 0, 'NGN', NULL, '2026-03-29T04:59:45.174Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69cb-069a-7264-b5316c0b99b8', '00000000-69cb-069a-7264-b5316c0b99b6', 0, 'NGN', NULL, '2026-03-30T23:26:18.622Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69cb-10d7-7264-b5316c0b99c3', '00000000-69cb-10d7-7264-b5316c0b99c1', 31.600000000000023, 'NGN', '2026-05-02T23:00:28.696Z', '2026-03-31T00:09:59.730Z', '2026-05-02T23:00:28.696Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69cc-b69b-7264-b5316c0ba236', '00000000-69cc-b69b-7264-b5316c0ba234', 0, 'NGN', NULL, '2026-04-01T06:09:31.657Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69cf-7d44-7264-b5316c0bb281', '00000000-69cf-7d44-7264-b5316c0bb27f', 11.5, 'NGN', '2026-05-17T10:25:26.883Z', '2026-04-03T08:41:40.088Z', '2026-05-17T10:25:26.883Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69d4-1c7c-7264-b5316c0bcdc4', '00000000-69d4-1c7c-7264-b5316c0bcdc2', 0, 'NGN', '2026-04-10T08:02:28.784Z', '2026-04-06T20:50:04.685Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69d9-5a05-7264-b5316c0bea7b', '00000000-69d9-5a05-7264-b5316c0bea79', 0, 'NGN', NULL, '2026-04-10T20:13:57.836Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69db-a462-7264-b5316c0bf31f', '00000000-69db-a462-7264-b5316c0bf31d', 0, 'NGN', NULL, '2026-04-12T13:55:46.567Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69dd-1a46-7264-b5316c0bf83e', '00000000-69dd-1a46-7264-b5316c0bf83c', 0, 'NGN', NULL, '2026-04-13T16:31:02.114Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69dd-5437-7264-b5316c0bfc6b', '00000000-69dd-5437-7264-b5316c0bfc69', 0, 'NGN', NULL, '2026-04-13T20:38:15.280Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69dd-fcec-7264-b5316c0c008e', '00000000-69dd-fcec-7264-b5316c0c008c', 0, 'NGN', '2026-04-19T15:40:48.072Z', '2026-04-14T08:38:04.006Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69de-12e0-7264-b5316c0c014a', '00000000-69de-12e0-7264-b5316c0c0148', 0, 'NGN', NULL, '2026-04-14T10:11:44.674Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69de-56a6-7264-b5316c0c02a6', '00000000-69de-56a6-7264-b5316c0c02a4', 0, 'NGN', NULL, '2026-04-14T15:00:54.834Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69de-7d72-7264-b5316c0c0489', '00000000-69de-7d72-7264-b5316c0c0487', 0, 'NGN', NULL, '2026-04-14T17:46:26.278Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69df-6f37-7264-b5316c0c09a8', '00000000-69df-6f37-7264-b5316c0c09a6', 0, 'NGN', NULL, '2026-04-15T10:57:59.734Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69df-79f9-7264-b5316c0c0a35', '00000000-69df-79f9-7264-b5316c0c0a33', 0, 'NGN', '2026-04-15T12:25:29.382Z', '2026-04-15T11:43:53.885Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69df-888d-73c6-958a017cec1f', '00000000-69df-888d-73c6-958a017cec1d', 0, 'NGN', NULL, '2026-04-15T12:46:05.118Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69df-af04-73c6-958a017cecfb', '00000000-69df-af04-73c6-958a017cecf9', 0, 'NGN', NULL, '2026-04-15T15:30:12.585Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69df-e169-73c6-958a017cf06b', '00000000-69df-e169-73c6-958a017cf069', 0, 'NGN', NULL, '2026-04-15T19:05:13.782Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69e2-98ae-73c6-958a017d04c6', '00000000-69e2-98ae-73c6-958a017d04c4', 0, 'NGN', NULL, '2026-04-17T20:31:42.203Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69e2-cc7f-73c6-958a017d0959', '00000000-69e2-cc7f-73c6-958a017d0957', 0, 'NGN', NULL, '2026-04-18T00:12:47.349Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69e4-df9b-73c6-958a017d16ea', '00000000-69e4-df9b-73c6-958a017d16e8', 1, 'NGN', '2026-07-08T04:09:41.258Z', '2026-04-19T13:58:51.942Z', '2026-07-08T04:09:41.258Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69e7-1328-73c6-958a017d1fb5', '00000000-69e7-1328-73c6-958a017d1fb3', 0, 'NGN', NULL, '2026-04-21T06:03:20.271Z', '2026-04-21T10:36:21.762Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69e8-a0cc-1b83-c92d32043ebe', '00000000-69e8-a0cc-1b83-c92d32043ebc', 295, 'NGN', '2026-06-16T19:53:29.819Z', '2026-04-22T10:19:56.842Z', '2026-06-16T19:53:29.819Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69e9-3835-1b83-c92d320443c6', '00000000-69e9-3835-1b83-c92d320443c4', 0, 'NGN', NULL, '2026-04-22T21:05:57.096Z', '2026-04-22T21:05:57.096Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69ea-76f1-1b83-c92d32044760', '00000000-69ea-76f1-1b83-c92d3204475e', 0, 'NGN', NULL, '2026-04-23T19:45:53.466Z', '2026-04-23T19:45:53.466Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69ea-a6e5-1b83-c92d32044908', '00000000-69ea-a6e5-1b83-c92d32044906', 27.600000000000023, 'NGN', '2026-07-12T18:51:17.742Z', '2026-04-23T23:10:29.801Z', '2026-07-12T18:51:17.742Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69eb-0856-1b83-c92d32044975', '00000000-69eb-0856-1b83-c92d32044973', 200, 'NGN', '2026-05-20T06:44:42.139Z', '2026-04-24T06:06:14.693Z', '2026-05-20T06:44:42.139Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69eb-b01f-1b83-c92d32044bfe', '00000000-69eb-b01f-1b83-c92d32044bfc', 0, 'NGN', NULL, '2026-04-24T18:02:07.242Z', '2026-04-24T18:02:07.242Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69eb-c665-1b83-c92d32044cff', '00000000-69eb-c665-1b83-c92d32044cfd', 0, 'NGN', NULL, '2026-04-24T19:37:09.723Z', '2026-04-24T19:37:09.723Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69ed-19f3-1b83-c92d32045435', '00000000-69ed-19f3-1b83-c92d32045433', 0, 'NGN', NULL, '2026-04-25T19:45:55.569Z', '2026-04-25T19:45:55.569Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69ee-86c6-1b83-c92d32045e0f', '00000000-69ee-86c6-1b83-c92d32045e0d', 0, 'NGN', NULL, '2026-04-26T21:42:30.701Z', '2026-04-26T21:42:30.701Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69ef-e0ee-1b83-c92d32046494', '00000000-69ef-e0ee-1b83-c92d32046492', 4.2000000000000455, 'NGN', '2026-07-09T11:27:34.986Z', '2026-04-27T22:19:26.531Z', '2026-07-09T11:27:34.986Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69f2-0a37-1b83-c92d32046e42', '00000000-69f2-0a37-1b83-c92d32046e40', 0, 'NGN', NULL, '2026-04-29T13:40:07.482Z', '2026-04-29T13:40:07.482Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69f3-2130-1b83-c92d320473fe', '00000000-69f3-2130-1b83-c92d320473fc', 0, 'NGN', NULL, '2026-04-30T09:30:24.242Z', '2026-04-30T09:30:24.242Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69f5-f3d2-1b83-c92d3204827c', '00000000-69f5-f3d2-1b83-c92d3204827a', 31.80000000000001, 'NGN', '2026-05-02T13:05:32.719Z', '2026-05-02T12:53:38.576Z', '2026-05-02T13:05:32.719Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69f6-0554-1b83-c92d32048321', '00000000-69f6-0554-1b83-c92d3204831f', 0, 'NGN', NULL, '2026-05-02T14:08:20.190Z', '2026-05-02T14:08:20.190Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69f7-3175-1b83-c92d32048aff', '00000000-69f7-3175-1b83-c92d32048afd', 0, 'NGN', NULL, '2026-05-03T11:28:53.134Z', '2026-05-03T11:28:53.134Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69f7-9969-1b83-c92d32048c1e', '00000000-69f7-9969-1b83-c92d32048c1c', 0, 'NGN', NULL, '2026-05-03T18:52:25.987Z', '2026-05-03T18:52:25.987Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69f7-9efe-1b83-c92d32048c8b', '00000000-69f7-9efe-1b83-c92d32048c89', 0, 'NGN', NULL, '2026-05-03T19:16:14.779Z', '2026-05-03T19:16:14.779Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69f7-a01c-1b83-c92d32048cb8', '00000000-69f7-a01c-1b83-c92d32048cb6', 90, 'NGN', '2026-05-05T22:23:20.785Z', '2026-05-03T19:21:00.095Z', '2026-05-05T22:23:20.785Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69f8-f2df-1b83-c92d32049258', '00000000-69f8-f2df-1b83-c92d32049256', 0, 'NGN', NULL, '2026-05-04T19:26:23.952Z', '2026-05-04T19:26:23.952Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69fa-071b-1b83-c92d32049844', '00000000-69fa-071b-1b83-c92d32049842', 0, 'NGN', NULL, '2026-05-05T15:04:59.916Z', '2026-05-05T15:04:59.916Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69fa-092e-1b83-c92d320498b6', '00000000-69fa-092e-1b83-c92d320498b4', 0, 'NGN', NULL, '2026-05-05T15:13:50.334Z', '2026-05-05T15:13:50.334Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69fb-1a8b-1b83-c92d32049e2f', '00000000-69fb-1a8b-1b83-c92d32049e2d', 587.6500000000001, 'NGN', '2026-07-08T10:10:05.212Z', '2026-05-06T10:40:11.878Z', '2026-07-08T10:10:05.212Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69fb-39ef-1b83-c92d32049f3d', '00000000-69fb-39ef-1b83-c92d32049f3b', 567, 'NGN', '2026-05-18T00:33:49.166Z', '2026-05-06T12:54:07.554Z', '2026-05-18T00:33:49.166Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69fb-c2c9-1b83-c92d3204a24f', '00000000-69fb-c2c9-1b83-c92d3204a24d', 180, 'NGN', '2026-05-23T13:20:55.025Z', '2026-05-06T22:38:01.717Z', '2026-05-23T13:20:55.025Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69fc-1cb6-1b83-c92d3204a2c7', '00000000-69fc-1cb6-1b83-c92d3204a2c5', 0, 'NGN', NULL, '2026-05-07T05:01:42.522Z', '2026-05-07T05:01:42.522Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69fd-f47f-1b83-c92d3204a9ad', '00000000-69fd-f47f-1b83-c92d3204a9ab', 90, 'NGN', '2026-05-27T09:59:52.013Z', '2026-05-08T14:34:39.923Z', '2026-05-27T09:59:52.013Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69ff-0b82-1b83-c92d3204aff5', '00000000-69ff-0b82-1b83-c92d3204aff3', 0, 'NGN', NULL, '2026-05-09T10:25:06.845Z', '2026-05-09T10:25:06.845Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-69ff-a0bb-1b83-c92d3204b3be', '00000000-69ff-a0bb-1b83-c92d3204b3bc', 1044, 'NGN', '2026-07-04T21:25:29.899Z', '2026-05-09T21:01:47.383Z', '2026-07-04T21:25:29.899Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6a00-dcf6-1b83-c92d3204baf0', '00000000-6a00-dcf6-1b83-c92d3204baee', 15.439999999999998, 'NGN', '2026-06-28T18:37:11.351Z', '2026-05-10T19:31:02.188Z', '2026-06-28T18:37:11.351Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6a02-45b2-1b83-c92d3204c5db', '00000000-6a02-45b2-1b83-c92d3204c5d9', 35, 'NGN', '2026-05-13T09:50:36.553Z', '2026-05-11T21:10:10.384Z', '2026-05-13T09:50:36.553Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6a03-39f9-1b83-c92d3204c876', '00000000-6a03-39f9-1b83-c92d3204c874', 0, 'NGN', NULL, '2026-05-12T14:32:25.928Z', '2026-05-12T14:32:25.928Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6a03-4663-1b83-c92d3204c897', '00000000-6a03-4663-1b83-c92d3204c895', 0, 'NGN', NULL, '2026-05-12T15:25:23.354Z', '2026-05-12T15:25:23.354Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6a04-db63-1b83-c92d3204d3d5', '00000000-6a04-db63-1b83-c92d3204d3d3', 37.5, 'NGN', '2026-06-09T14:47:02.994Z', '2026-05-13T20:13:23.902Z', '2026-06-09T14:47:02.994Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6a05-85df-1b83-c92d3204d715', '00000000-6a05-85df-1b83-c92d3204d713', 101, 'NGN', '2026-06-17T08:56:34.754Z', '2026-05-14T08:20:47.303Z', '2026-06-17T08:56:34.754Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6a05-ed1d-1b83-c92d3204d8c6', '00000000-6a05-ed1d-1b83-c92d3204d8c4', 0, 'NGN', NULL, '2026-05-14T15:41:17.743Z', '2026-05-14T15:41:17.743Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6a08-89a4-1b83-c92d3204e4a9', '00000000-6a08-89a4-1b83-c92d3204e4a7', 0, 'NGN', NULL, '2026-05-16T15:13:40.643Z', '2026-05-16T15:13:40.643Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6a0a-2b48-1b83-c92d3204ef08', '00000000-6a0a-2b48-1b83-c92d3204ef06', 0, 'NGN', NULL, '2026-05-17T20:55:36.129Z', '2026-05-17T20:55:36.129Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6a0a-2cf2-1b83-c92d3204ef3c', '00000000-6a0a-2cf2-1b83-c92d3204ef3a', 0, 'NGN', NULL, '2026-05-17T21:02:42.796Z', '2026-05-17T21:02:42.796Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6a0a-e891-1b83-c92d3204f1a4', '00000000-6a0a-e891-1b83-c92d3204f1a2', 14.300000000000125, 'NGN', '2026-06-10T19:31:10.283Z', '2026-05-18T10:23:13.748Z', '2026-06-10T19:31:10.283Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6a0a-f115-1b83-c92d3204f243', '00000000-6a0a-f115-1b83-c92d3204f241', 0, 'NGN', '2026-05-21T10:30:03.660Z', '2026-05-18T10:59:33.137Z', '2026-05-21T10:30:03.660Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6a0b-6ab6-1b83-c92d3204f4a2', '00000000-6a0b-6ab6-1b83-c92d3204f4a0', 0, 'NGN', NULL, '2026-05-18T19:38:30.991Z', '2026-05-18T19:38:30.991Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6a0b-98ef-1b83-c92d3204f6e9', '00000000-6a0b-98ef-1b83-c92d3204f6e7', 0, 'NGN', NULL, '2026-05-18T22:55:43.724Z', '2026-05-18T22:55:43.724Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6a0c-535b-1b83-c92d3204f9e3', '00000000-6a0c-535b-1b83-c92d3204f9e1', 0, 'NGN', NULL, '2026-05-19T12:11:07.922Z', '2026-05-19T12:11:07.922Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6a0c-54cb-1b83-c92d3204fa0c', '00000000-6a0c-54cb-1b83-c92d3204fa0a', 2.699999999999932, 'NGN', '2026-06-07T20:52:08.712Z', '2026-05-19T12:17:15.903Z', '2026-06-07T20:52:08.712Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6a0c-891e-1b83-c92d3204fbd7', '00000000-6a0c-891e-1b83-c92d3204fbd5', 2426.8, 'NGN', '2026-07-11T22:23:10.455Z', '2026-05-19T16:00:30.333Z', '2026-07-11T22:23:10.455Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6a0d-b4a5-1b83-c92d32050377', '00000000-6a0d-b4a5-1b83-c92d32050375', 0, 'NGN', NULL, '2026-05-20T13:18:29.466Z', '2026-05-20T13:18:29.466Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6a10-3738-1b83-c92d32050da3', '00000000-6a10-3738-1b83-c92d32050da1', 0, 'NGN', NULL, '2026-05-22T11:00:08.623Z', '2026-05-22T11:00:08.623Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6a10-e992-1b83-c92d320510c1', '00000000-6a10-e992-1b83-c92d320510bf', 0, 'NGN', NULL, '2026-05-22T23:41:06.668Z', '2026-05-22T23:41:06.668Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6a12-cc0e-1b83-c92d3205170f', '00000000-6a12-cc0e-1b83-c92d3205170d', 48, 'NGN', '2026-05-26T12:09:54.273Z', '2026-05-24T09:59:42.861Z', '2026-05-26T12:09:54.273Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6a16-a58b-48ca-75899e17d54f', '00000000-6a16-a58b-48ca-75899e17d54d', 5049, 'NGN', '2026-06-26T22:20:06.187Z', '2026-05-27T08:04:27.457Z', '2026-06-26T22:20:06.187Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6a17-5896-48ca-75899e17dbd9', '00000000-6a17-5896-48ca-75899e17dbd7', 94.5200000000001, 'NGN', '2026-06-24T19:56:17.428Z', '2026-05-27T20:48:22.652Z', '2026-06-24T19:56:17.428Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6a19-d9aa-48ca-75899e17e6f1', '00000000-6a19-d9aa-48ca-75899e17e6ef', 0, 'NGN', NULL, '2026-05-29T18:23:38.259Z', '2026-05-29T18:23:38.259Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6a19-db1f-48ca-75899e17e730', '00000000-6a19-db1f-48ca-75899e17e72e', 0, 'NGN', NULL, '2026-05-29T18:29:51.751Z', '2026-05-29T18:29:51.751Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6a19-dcf5-48ca-75899e17e78f', '00000000-6a19-dcf5-48ca-75899e17e78d', 0, 'NGN', NULL, '2026-05-29T18:37:41.295Z', '2026-05-29T18:37:41.295Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6a1c-072a-48ca-75899e17f271', '00000000-6a1c-072a-48ca-75899e17f26f', 0, 'NGN', NULL, '2026-05-31T10:02:18.777Z', '2026-05-31T10:02:18.777Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6a24-4833-48ca-75899e181181', '00000000-6a24-4833-48ca-75899e18117f', 0, 'NGN', NULL, '2026-06-06T16:17:55.256Z', '2026-06-06T16:17:55.256Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6a26-e36f-48ca-75899e181a47', '00000000-6a26-e36f-48ca-75899e181a45', 45, 'NGN', '2026-06-08T15:49:26.554Z', '2026-06-08T15:44:47.893Z', '2026-06-08T15:49:26.554Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6a2f-2168-48ca-75899e1836ed', '00000000-6a2f-2168-48ca-75899e1836eb', 0, 'NGN', NULL, '2026-06-14T21:47:20.432Z', '2026-06-14T21:47:20.432Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6a2f-b43b-48ca-75899e183745', '00000000-6a2f-b43b-48ca-75899e183743', 50, 'NGN', '2026-06-19T03:50:26.792Z', '2026-06-15T08:13:47.746Z', '2026-06-19T03:50:26.792Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6a32-78b2-48ca-75899e183ed6', '00000000-6a32-78b2-48ca-75899e183ed4', 295, 'NGN', '2026-06-21T21:03:02.647Z', '2026-06-17T10:36:34.486Z', '2026-06-21T21:03:02.647Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6a3b-a080-14ff-47214c202920', '00000000-6a3b-a080-14ff-47214c20291e', 0, 'NGN', NULL, '2026-06-24T09:16:48.982Z', '2026-06-24T09:16:48.982Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6a3f-a1db-14ff-47214c20325d', '00000000-6a3f-a1db-14ff-47214c20325b', 0, 'NGN', NULL, '2026-06-27T10:11:39.744Z', '2026-06-27T10:11:39.744Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6a4b-78e9-14ff-47214c204c33', '00000000-6a4b-78e9-14ff-47214c204c31', 540, 'NGN', '2026-07-12T21:18:35.196Z', '2026-07-06T09:44:09.557Z', '2026-07-12T21:18:35.196Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6a4e-a979-14ff-47214c2053f1', '00000000-6a4e-a979-14ff-47214c2053ef', 36, 'NGN', '2026-07-11T12:10:14.370Z', '2026-07-08T19:48:09.010Z', '2026-07-11T12:10:14.370Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6a54-1ece-14ff-47214c20614f', '00000000-6a54-1ece-14ff-47214c20614d', 0, 'NGN', NULL, '2026-07-12T23:10:06.294Z', '2026-07-12T23:10:06.294Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;
INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES ('00000000-6a54-dd9e-14ff-47214c2061f6', '00000000-6a54-dd9e-14ff-47214c2061f4', 0, 'NGN', NULL, '2026-07-13T12:44:14.029Z', '2026-07-13T12:44:14.029Z')
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;

-- 4. Insert Providers (1 providers)
INSERT INTO providers (id, name, code, base_url, api_key, secret_key, username, password, active, priority, supported_services, metadata, created_at, updated_at)
VALUES ('00000000-6923-93b7-e195-e70de4cc3c20', 'SME Plug', 'smeplug', 'https://smeplug.ng/api', 'a603f3e3b80a88826060f364719646c06efc2a0105eaf688fd032b8e6ac42aec', NULL, NULL, NULL, TRUE, 1, ARRAY['"airtime"', '"data"']::text[], '{"env":{"NEW_KEY":"3fa2af0c667c2298972d2067fbc1d5733cada9f0faffbd342297847233960f02"}}'::jsonb, '2025-11-23T23:07:35.046Z', '2026-04-21T12:47:30.962Z')
ON CONFLICT (code) DO UPDATE SET api_key = EXCLUDED.api_key, base_url = EXCLUDED.base_url, metadata = EXCLUDED.metadata;

-- 5. Insert Pricing Plans (66 plans)
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-692a-7dc6-4480-22289fe2e2f9', 1, 'MTN', 172, '172', 'MTN SME✅ 500MB From Murabusdata ', 285, NULL, 'DATA', 0, 5, TRUE, '2025-11-29T04:59:50.905Z', '2026-06-02T10:41:23.017Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-692a-7e13-4480-22289fe2e2fd', 1, 'MTN', 173, '173', 'MTN SME ✅ 1GB From Murabusdata', 382.5, NULL, 'DATA', 0, 13, TRUE, '2025-11-29T05:01:07.643Z', '2026-07-13T04:52:15.065Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-692a-7e6c-4480-22289fe2e30a', 1, 'MTN', 174, '174', 'MTN SME✅ 2GB From Murabusdata', 765, NULL, 'DATA', 0, 10, TRUE, '2025-11-29T05:02:36.920Z', '2026-07-13T04:56:02.615Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-692a-7ede-4480-22289fe2e315', 1, 'MTN', 175, '175', 'MTN SME✅ 3GBFrom Murabusdata', 1147.5, NULL, 'DATA', 0, 8, TRUE, '2025-11-29T05:04:30.106Z', '2026-07-13T04:56:59.972Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-692a-7f2c-4480-22289fe2e319', 1, 'MTN', 176, '176', 'MTN SME✅ 5GB Eid', 1912, NULL, 'DATA', 0, 10, TRUE, '2025-11-29T05:05:48.987Z', '2026-07-13T04:57:28.317Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-692a-8218-4480-22289fe2e33e', 1, 'MTN', 258, '258', '500MB✅ [Gifting] From Murabusdata', 540, NULL, 'DATA', 0, 5, TRUE, '2025-11-29T05:18:16.018Z', '2026-06-02T10:42:28.598Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-692a-831e-4480-22289fe2e353', 1, 'MTN', 231, '231', '1.5GB 2-Day Plan [Gifting]🎁 From Murabusdata', 700, NULL, 'DATA', 0, 5, TRUE, '2025-11-29T05:22:38.313Z', '2026-06-02T10:47:23.629Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-692a-83e7-4480-22289fe2e35e', 1, 'MTN', 227, '227', '2GB 2-Day Plan [Gifting] From Murabusdata ', 800, NULL, 'DATA', 0, 7, TRUE, '2025-11-29T05:25:59.385Z', '2026-07-09T11:24:45.730Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-692a-846c-4480-22289fe2e362', 1, 'MTN', 261, '261', '3.5GB Weekly Plan [Gifting]🎁', 1600, NULL, 'DATA', 0, 5, TRUE, '2025-11-29T05:28:12.633Z', '2026-03-29T04:54:53.241Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-692a-8529-4480-22289fe2e374', 1, 'MTN', 17, '17', '6GB Weekly Plan [Gifting]🎁', 2600, NULL, 'DATA', 0, 5, TRUE, '2025-11-29T05:31:21.770Z', '2026-03-29T04:53:46.381Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-692a-863f-4480-22289fe2e37f', 1, 'MTN', 18, '18', '2GB+2mins Monthly Plan [Gifting]🎁', 1600, NULL, 'DATA', 0, 5, TRUE, '2025-11-29T05:35:59.864Z', '2026-03-29T04:54:34.591Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-692a-8708-4480-22289fe2e392', 1, 'MTN', 21, '21', '7GB Monthly Plan [Gifting]🎁 ', 3600, NULL, 'DATA', 0, 2, TRUE, '2025-11-29T05:39:20.588Z', '2026-03-29T04:53:32.361Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-692a-876c-4480-22289fe2e396', 1, 'MTN', 226, '226', '11GB (Digital Bundle)✅ - 7 days', 3825, NULL, 'DATA', 0, 8, TRUE, '2025-11-29T05:41:00.458Z', '2026-07-13T04:57:53.115Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-692a-87d7-4480-22289fe2e39a', 1, 'MTN', 23, '23', '12.5 Monthly Plan [Gifting]🎁', 6000, NULL, 'DATA', 0, 6, TRUE, '2025-11-29T05:42:47.649Z', '2026-01-16T11:00:41.511Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-692a-8829-4480-22289fe2e39e', 1, 'MTN', 24, '24', '16.5GB+10mins Monthly Plan [Gifting]🎁', 7000, NULL, 'DATA', 0, 5, TRUE, '2025-11-29T05:44:09.646Z', '2026-01-16T10:39:32.942Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-692a-8880-4480-22289fe2e3a2', 1, 'MTN', 25, '25', '20GB Monthly Plan [Gifting]🎁', 8000, NULL, 'DATA', 0, 5, TRUE, '2025-11-29T05:45:36.048Z', '2026-01-16T10:39:34.246Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-692a-88da-4480-22289fe2e3a6', 1, 'MTN', 26, '26', '25GB Monthly Plan [Gifting]🎁', 9500, NULL, 'DATA', 0, 5, TRUE, '2025-11-29T05:47:06.342Z', '2026-01-16T10:39:35.806Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-692a-c63c-4480-22289fe2e54c', 2, 'Glo', 0, '321', '300MB - 2 Days From Murabusdata', 150, NULL, 'DATA', 0, 5, TRUE, '2025-11-29T10:09:00.531Z', '2026-06-02T10:50:22.239Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-692a-c6df-4480-22289fe2e566', 2, 'Glo', 322, '322', '600MB - 2 Days From Murabusdata', 250, NULL, 'DATA', 0, 7, TRUE, '2025-11-29T10:11:43.171Z', '2026-06-02T10:50:53.678Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-692a-c728-4480-22289fe2e56f', 2, 'Glo', 296, '296', 'Data - 500MB [Gifting]🏷️  From Murabusdata', 550, NULL, 'DATA', 0, 5, TRUE, '2025-11-29T10:12:56.251Z', '2026-06-02T10:51:22.912Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-692a-c831-4480-22289fe2e57b', 2, 'Glo', 394, '394', '2GB - 2 Days From Murabusdata', 600, NULL, 'DATA', 0, 7, TRUE, '2025-11-29T10:17:21.942Z', '2026-06-02T10:52:30.151Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-692a-c892-4480-22289fe2e583', 2, 'Glo', 411, '411', '1.5GB - 1Day From Murabusdata', 600, NULL, 'DATA', 0, 7, TRUE, '2025-11-29T10:18:58.773Z', '2026-06-02T10:51:51.271Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-692a-c8f4-4480-22289fe2e591', 2, 'Glo', 0, '298', '1GB [Gifting]🏷️ From Murabusdata', 850, NULL, 'DATA', 0, 3, TRUE, '2025-11-29T10:20:36.028Z', '2026-06-02T10:51:36.958Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-692a-c92c-4480-22289fe2e598', 2, 'Glo', 409, '409', '3GB - Data - 2Days', 850, NULL, 'DATA', 0, 5, TRUE, '2025-11-29T10:21:32.345Z', '2026-03-29T04:51:04.557Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-692a-c95f-4480-22289fe2e59f', 2, 'Glo', 300, '300', 'Data - 3.5GB [Gifting]🎁', 1600, NULL, 'DATA', 0, 5, TRUE, '2025-11-29T10:22:23.727Z', '2026-03-29T04:50:33.573Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-692a-c995-4480-22289fe2e5a6', 2, 'Glo', 410, '410', ' SME 5GB✅', 1700, NULL, 'DATA', 0, 5, TRUE, '2025-11-29T10:23:17.372Z', '2026-03-29T04:50:18.962Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-692a-c9f2-4480-22289fe2e5ae', 2, 'Glo', 305, '305', 'Monthly Plan- Data - 3GB [Gifting]🎁', 2150, NULL, 'DATA', 0, 5, TRUE, '2025-11-29T10:24:50.699Z', '2026-03-29T04:50:01.262Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-692a-ca2d-4480-22289fe2e5b5', 2, 'Glo', 450, '450', '8.0 GB - 30 Days', 2250, NULL, 'DATA', 0, 5, TRUE, '2025-11-29T10:25:49.626Z', '2026-03-29T04:49:29.147Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-692a-ca7d-4480-22289fe2e5bc', 2, 'Glo', 325, '325', '10GB - 30 Days', 3250, NULL, 'DATA', 0, 5, TRUE, '2025-11-29T10:27:09.267Z', '2026-03-29T04:49:13.093Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-6946-6ead-eeea-3fc22a3b77cb', 1, 'MTN', 22, '22', '10GB + 10mins Monthly Plan [Gifting]🎁', 4900, NULL, 'DATA', 0, 6, TRUE, '2025-12-20T09:38:53.627Z', '2026-01-16T11:00:42.501Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-6949-03f9-de74-fefd3f9679b9', 2, 'Glo', 450, '450', '8.0 GB - 30 Days', 2200, NULL, 'DATA', 0, 5, TRUE, '2025-12-22T08:40:25.252Z', '2026-03-29T04:49:43.890Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-6956-05ca-6221-f213880fa253', 3, 'Airtel', 428, '428', '1GB [Corporate]💼 - 3 Days From Murabusdata', 390, NULL, 'DATA', 0, 5, TRUE, '2026-01-01T05:27:38.550Z', '2026-06-02T10:53:13.799Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-6956-0622-6221-f213880fa25b', 3, 'Airtel', 429, '429', '1GB [Corporate]💼 - 7 Days From Murabusdata', 450, NULL, 'DATA', 0, 5, TRUE, '2026-01-01T05:29:06.730Z', '2026-06-02T10:53:30.359Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-6956-0678-6221-f213880fa25d', 3, 'Airtel', 431, '431', '1GB [Corporate]💼 - 30 Days From Murabusdata', 550, NULL, 'DATA', 0, 5, TRUE, '2026-01-01T05:30:32.991Z', '2026-06-02T10:53:42.614Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-6956-06f0-6221-f213880fa25f', 3, 'Airtel', 432, '432', '500MB [Corporate] 💼- 30 Days From Murabusdata', 290, NULL, 'DATA', 0, 5, TRUE, '2026-01-01T05:32:32.446Z', '2026-06-02T10:52:56.963Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-6956-075a-6221-f213880fa265', 3, 'Airtel', 433, '433', ' 3GB [Corporate]💼 - 3 Days From Murabusdata', 1100, NULL, 'DATA', 0, 5, TRUE, '2026-01-01T05:34:18.996Z', '2026-06-02T10:53:55.021Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-6956-07eb-6221-f213880fa267', 3, 'Airtel', 436, '436', '5GB [Corporate]💼 - 3 Days', 1700, NULL, 'DATA', 0, 5, TRUE, '2026-01-01T05:36:43.088Z', '2026-01-16T10:40:14.491Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-6956-082f-6221-f213880fa269', 3, 'Airtel', 438, '438', '5GB [Corporate]💼 - 14 Days', 2000, NULL, 'DATA', 0, 5, TRUE, '2026-01-01T05:37:51.317Z', '2026-01-16T10:40:15.955Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-6956-08e2-8b59-d9ec2102f5a6', 3, 'Airtel', 440, '440', '5GB [Corporate]💼 - 30 Days', 2500, NULL, 'DATA', 0, 5, TRUE, '2026-01-01T05:40:50.270Z', '2026-01-16T10:40:18.914Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-6956-0927-8b59-d9ec2102f5ab', 3, 'Airtel', 439, '439', '3GB [Corporate]💼 - 30 Days', 1500, NULL, 'DATA', 0, 5, TRUE, '2026-01-01T05:41:59.925Z', '2026-01-16T10:40:13.112Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-6956-0969-8b59-d9ec2102f5ad', 3, 'Airtel', 333, '333', '2.5GB - 2 Days From Murabusdata', 600, NULL, 'DATA', 0, 5, TRUE, '2026-01-01T05:43:05.347Z', '2026-06-02T10:54:24.116Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-6956-099d-8b59-d9ec2102f5af', 3, 'Airtel', 444, '444', '2GB [Corporate]💼 - 30 Days From Murabusdata', 1000, NULL, 'DATA', 0, 5, TRUE, '2026-01-01T05:43:57.070Z', '2026-06-02T10:54:07.631Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-6956-09d3-8b59-d9ec2102f5b1', 3, 'Airtel', 334, '334', '10GB - 7 Days', 2300, NULL, 'DATA', 0, 5, TRUE, '2026-01-01T05:44:51.052Z', '2026-01-16T10:40:17.193Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-695a-0786-6221-f213880fad81', 1, 'MTN', 498, '498', '1GB Daily From Murabusdata ', 300, NULL, 'DATA', 0, 8, FALSE, '2026-01-04T06:24:06.402Z', '2026-05-17T13:25:47.328Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-695a-0826-8b59-d9ec2103011f', 1, 'MTN', 453, '453', '2.5GB Daily From Murabusdata', 700, NULL, 'DATA', 0, 5, TRUE, '2026-01-04T06:26:46.098Z', '2026-06-02T10:48:40.411Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-695b-cd29-6221-f213880fb52f', 4, '9mobile', 201, '201', '1GB Daily + 100MB From Murabusdata', 400, NULL, 'DATA', 0, 5, TRUE, '2026-01-05T14:39:37.402Z', '2026-06-02T10:55:08.218Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-695b-cd6a-8b59-d9ec210308f8', 4, '9mobile', 84, '84', '1GB Weekly data plan From Murabusdata', 650, NULL, 'DATA', 0, 5, TRUE, '2026-01-05T14:40:42.049Z', '2026-06-02T10:54:43.656Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-695b-ce0d-6221-f213880fb533', 4, '9mobile', 76, '76', '2GB (1GB +1GB Night)', 650, NULL, 'DATA', 0, 5, TRUE, '2026-01-05T14:43:25.433Z', '2026-01-16T10:40:25.833Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-695b-ce5b-8b59-d9ec210308fc', 4, '9mobile', 208, '208', '2GB 3-Days +100MB Social', 650, NULL, 'DATA', 0, 5, TRUE, '2026-01-05T14:44:43.712Z', '2026-01-16T10:40:27.254Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-695b-ce9f-6221-f213880fb537', 4, '9mobile', 414, '414', '5.5GB all time + 4GB night Monthly', 2300, NULL, 'DATA', 0, 7, TRUE, '2026-01-05T14:45:51.428Z', '2026-01-16T10:59:44.222Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-695b-cef1-6221-f213880fb540', 4, '9mobile', 79, '79', '11GB (7GB all time + 4gb night)', 2800, NULL, 'DATA', 0, 8, TRUE, '2026-01-05T14:47:13.136Z', '2026-01-16T10:59:42.814Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-695b-cf21-6221-f213880fb543', 4, '9mobile', 484, '184', '24GB monthly', 5500, NULL, 'DATA', 0, 6, TRUE, '2026-01-05T14:48:01.544Z', '2026-01-16T10:59:41.532Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-695b-cfcf-6221-f213880fb55d', 4, '9mobile', 219, '219', '650MB Daily From Murabusdata', 300, NULL, 'DATA', 0, 5, TRUE, '2026-01-05T14:50:55.648Z', '2026-06-02T10:55:25.560Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-695b-d012-6221-f213880fb562', 4, '9mobile', 207, '207', '250MB Weekly From Murabusdata', 275, NULL, 'DATA', 0, 5, TRUE, '2026-01-05T14:52:02.073Z', '2026-06-02T10:55:38.746Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-695b-d2b4-8b59-d9ec2103092a', 4, '9mobile', 77, '77', '6.5GB (2.5GB all time + 4GB night)', 1500, NULL, 'DATA', 0, 5, TRUE, '2026-01-05T15:03:16.550Z', '2026-01-16T10:40:28.713Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-695c-e6bd-8b59-d9ec21030bda', 2, 'Glo', 290, '290', 'Social (3 Days)- 1GB From Murabusdata', 350, NULL, 'DATA', 0, 6, TRUE, '2026-01-06T10:41:01.077Z', '2026-06-02T10:51:09.380Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-696f-105b-e751-5e1550be04cc', 1, 'MTN', 455, '455', '4GB 2-Days From Murabusdata', 1350, NULL, 'DATA', 0, 0, TRUE, '2026-01-20T05:19:23.752Z', '2026-06-02T10:49:00.958Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-696f-10e1-e751-5e1550be04cf', 1, 'MTN', 456, '456', '5.5GB 2-Days', 1650, NULL, 'DATA', 0, 0, TRUE, '2026-01-20T05:21:37.955Z', '2026-03-29T04:54:17.188Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-696f-1131-27eb-059addcfdde2', 1, 'MTN', 454, '454', '3.5GB Daily From Murabusdata ', 1150, NULL, 'DATA', 0, 0, TRUE, '2026-01-20T05:22:57.136Z', '2026-06-02T10:49:48.623Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-6975-c47c-27eb-059addcfedea', 2, 'Glo', 299, '299', '1.5GB [Gifting]', 1150, NULL, 'DATA', 0, 0, TRUE, '2026-01-25T07:21:32.291Z', '2026-03-29T04:50:48.200Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-69f9-b65c-1b83-c92d32049606', 1, 'MTN', 0, '510', '1GB 30days - cooperate ', 300, NULL, 'DATA', 0, 0, FALSE, '2026-05-05T09:20:28.160Z', '2026-05-07T17:21:22.136Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-69fc-c9c9-1b83-c92d3204a5e7', 1, 'MTN', 511, '511', '5GB - 14 Days ✅', 1700, NULL, 'DATA', 0, 0, TRUE, '2026-05-07T17:20:09.411Z', '2026-05-09T11:29:31.622Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-6a08-0ca3-1b83-c92d3204e179', 1, 'MTN', 250, '250', '2GB TikTok Weekly [Social]💃🕺 From Murabusdata', 450, NULL, 'DATA', 0, 0, TRUE, '2026-05-16T06:20:19.802Z', '2026-06-23T11:38:38.432Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-6a1c-af77-48ca-75899e17f875', 1, 'MTN', 0, '424', 'MTN SME✅ 1GB From Murabusdata', 450, NULL, 'DATA', 0, 0, FALSE, '2026-05-31T22:00:23.265Z', '2026-07-09T11:24:33.254Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-6a45-7693-14ff-47214c203fc8', 1, 'MTN', 0, '426', 'MTN SME✅ 3GB From Murabusdata', 1200, NULL, 'DATA', 0, 0, FALSE, '2026-07-01T20:20:35.977Z', '2026-07-10T13:34:51.033Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;
INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES ('00000000-6a4d-3567-14ff-47214c204f48', 1, 'MTN', 425, '425', 'MTN SME✅ 2GB FROM Murabusdata', 900, NULL, 'DATA', 0, 0, FALSE, '2026-07-07T17:20:39.415Z', '2026-07-09T11:24:59.366Z')
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;

-- 6. Insert Airtime To Cash Settings (2 settings)
INSERT INTO airtime_to_cash_settings (id, network, discount_rate, min_amount, max_amount, phone_number, active, updated_at)
VALUES ('00000000-6989-e8c0-19f2-0ddc42aae1e3', 'MTN', 90, 500, 1000000, '09162989954', TRUE, '2026-05-09T11:41:08.988Z')
ON CONFLICT (id) DO UPDATE SET discount_rate = EXCLUDED.discount_rate, phone_number = EXCLUDED.phone_number;
INSERT INTO airtime_to_cash_settings (id, network, discount_rate, min_amount, max_amount, phone_number, active, updated_at)
VALUES ('00000000-6989-f9b9-494b-caf161260788', 'Airtel', 80, 500, 100000, '09025237660', TRUE, '2026-04-17T19:32:35.305Z')
ON CONFLICT (id) DO UPDATE SET discount_rate = EXCLUDED.discount_rate, phone_number = EXCLUDED.phone_number;

-- 7. Insert Airtime To Cash Requests (15 requests)
INSERT INTO airtime_to_cash_requests (id, user_id, network, phone_number, amount, amount_to_receive, status, admin_note, created_at, updated_at)
VALUES ('00000000-6989-e8dd-494b-caf161260725', '00000000-6912-fc24-13ca-4b97ddad1754', 'MTN', '08100015498', 2000, 800, 'approved', '', '2026-02-09T14:02:05.001Z', '2026-02-09T14:02:27.953Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO airtime_to_cash_requests (id, user_id, network, phone_number, amount, amount_to_receive, status, admin_note, created_at, updated_at)
VALUES ('00000000-698a-3a78-494b-caf161260ac5', '00000000-691c-8e9c-0905-272b76d063c7', 'MTN', '09162989954', 5000, 4500, 'approved', 'Send your account details ', '2026-02-09T19:50:16.000Z', '2026-02-09T19:51:32.295Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO airtime_to_cash_requests (id, user_id, network, phone_number, amount, amount_to_receive, status, admin_note, created_at, updated_at)
VALUES ('00000000-698c-e4f2-494b-caf161261b32', '00000000-6911-dd9b-efea-b41fdcf20564', 'MTN', '09138826727', 10000, 9000, 'rejected', '', '2026-02-11T20:22:10.514Z', '2026-04-30T13:45:21.101Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO airtime_to_cash_requests (id, user_id, network, phone_number, amount, amount_to_receive, status, admin_note, created_at, updated_at)
VALUES ('00000000-698e-f6da-19f2-0ddc42aafb27', '00000000-691c-8e9c-0905-272b76d063c7', 'Airtel', '09070837215', 500, 400, 'rejected', '', '2026-02-13T10:03:06.543Z', '2026-04-30T07:40:39.555Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO airtime_to_cash_requests (id, user_id, network, phone_number, amount, amount_to_receive, status, admin_note, created_at, updated_at)
VALUES ('00000000-698e-f7de-19f2-0ddc42aafb48', '00000000-691c-8e9c-0905-272b76d063c7', 'MTN', '09162989954', 2500, 2250, 'rejected', 'You are not send', '2026-02-13T10:07:26.958Z', '2026-04-30T07:41:16.132Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO airtime_to_cash_requests (id, user_id, network, phone_number, amount, amount_to_receive, status, admin_note, created_at, updated_at)
VALUES ('00000000-6997-1aff-494b-caf161264186', '00000000-6953-d3b2-de74-fefd3f96944f', 'MTN', '08164727733', 1000, 900, 'rejected', '', '2026-02-19T14:15:27.148Z', '2026-04-30T13:45:10.723Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO airtime_to_cash_requests (id, user_id, network, phone_number, amount, amount_to_receive, status, admin_note, created_at, updated_at)
VALUES ('00000000-69ab-ef88-17bc-f54fb116c993', '00000000-698a-f57a-494b-caf161260db8', 'MTN', '07068781815', 500, 450, 'rejected', '', '2026-03-07T09:27:36.992Z', '2026-04-30T13:45:07.739Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO airtime_to_cash_requests (id, user_id, network, phone_number, amount, amount_to_receive, status, admin_note, created_at, updated_at)
VALUES ('00000000-69ab-effc-17bc-f54fb116c99f', '00000000-698a-f57a-494b-caf161260db8', 'MTN', '07068781815', 500, 450, 'rejected', '', '2026-03-07T09:29:32.506Z', '2026-04-30T13:45:04.314Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO airtime_to_cash_requests (id, user_id, network, phone_number, amount, amount_to_receive, status, admin_note, created_at, updated_at)
VALUES ('00000000-69e2-002d-73c6-958a017cfcf1', '00000000-69de-56a6-7264-b5316c0c02a4', 'MTN', '08067777765', 20000, 18000, 'rejected', '', '2026-04-17T09:41:01.294Z', '2026-04-30T13:45:00.090Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO airtime_to_cash_requests (id, user_id, network, phone_number, amount, amount_to_receive, status, admin_note, created_at, updated_at)
VALUES ('00000000-69e5-0bf7-73c6-958a017d18a6', '00000000-691c-8e9c-0905-272b76d063c7', 'MTN', '09162990512', 500, 450, 'rejected', 'You have not send???', '2026-04-19T17:08:07.375Z', '2026-04-30T07:42:27.693Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO airtime_to_cash_requests (id, user_id, network, phone_number, amount, amount_to_receive, status, admin_note, created_at, updated_at)
VALUES ('00000000-69e6-64d5-73c6-958a017d1e31', '00000000-698b-37c0-19f2-0ddc42aaeaf7', 'MTN', '09065136153', 2000, 1800, 'rejected', 'You are not send ', '2026-04-20T17:39:33.323Z', '2026-04-30T07:45:32.490Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO airtime_to_cash_requests (id, user_id, network, phone_number, amount, amount_to_receive, status, admin_note, created_at, updated_at)
VALUES ('00000000-6a38-4274-14ff-47214c2020e9', '00000000-691c-8e9c-0905-272b76d063c7', 'MTN', '09032379124', 500, 450, 'approved', '', '2026-06-21T19:58:44.576Z', '2026-06-21T20:00:24.945Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO airtime_to_cash_requests (id, user_id, network, phone_number, amount, amount_to_receive, status, admin_note, created_at, updated_at)
VALUES ('00000000-6a38-4291-14ff-47214c2020ed', '00000000-691c-8e9c-0905-272b76d063c7', 'Airtel', '09070837215', 1000, 800, 'approved', '', '2026-06-21T19:59:13.733Z', '2026-06-21T20:01:05.577Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO airtime_to_cash_requests (id, user_id, network, phone_number, amount, amount_to_receive, status, admin_note, created_at, updated_at)
VALUES ('00000000-6a38-42a5-14ff-47214c2020f1', '00000000-691c-8e9c-0905-272b76d063c7', 'MTN', '09162990512', 1500, 1350, 'approved', '', '2026-06-21T19:59:33.026Z', '2026-06-21T20:00:01.596Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO airtime_to_cash_requests (id, user_id, network, phone_number, amount, amount_to_receive, status, admin_note, created_at, updated_at)
VALUES ('00000000-6a3c-e7b6-14ff-47214c202cb7', '00000000-6a3b-a080-14ff-47214c20291e', 'MTN', '08033333333', 1000, 900, 'pending', '', '2026-06-25T08:32:54.161Z', '2026-06-25T08:32:54.161Z')
ON CONFLICT (id) DO NOTHING;

-- 8. Insert Referral Settings
INSERT INTO referral_settings (id, bonus_amount, min_withdrawal, active)
VALUES ('00000000-6989-e8b1-494b-caf16126071e', 200, 1000, TRUE)
ON CONFLICT (id) DO UPDATE SET bonus_amount = EXCLUDED.bonus_amount;

-- 9. Insert System Settings
INSERT INTO system_settings (id, type, config)
VALUES ('00000000-6989-bc4e-a268-f4072300a6f8', 'global_config', '{"email_config":{"smtp_host":"","smtp_port":587,"smtp_user":"murabusdatas@gmail.com","smtp_pass":"bjjk snft btan inld","smtp_secure":false,"sender_name":"MurabusData"},"notification_email":"","payment_gateway":"vtstack"}'::jsonb)
ON CONFLICT (type) DO UPDATE SET config = EXCLUDED.config;

-- 10. Insert Support Content
INSERT INTO support_content (id, content)
VALUES ('00000000-6926-f318-4480-22289fe2d275', '{"email":"murabusdatas@gmail.com","phoneNumber":"+2349162989954","whatsappNumber":"+2349162989954","websiteUrl":"https://ibdata.com.ng","instagramUrl":"https://ib_datasub.com","facebookUrl":"https://www.facebook.com/profile.php?id=61555320142370","twitterUrl":"https://Ibdatasub.com"}'::jsonb)
ON CONFLICT (id) DO UPDATE SET content = EXCLUDED.content;

-- 11. Insert Audit Logs (300 logs)
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6913-90e5-9535-c94f136b661f', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '6910c05d466d6b359621dcd7', '{"balance":148.99}'::jsonb, '{"balance":1148.99}'::jsonb, '100.64.0.3', '2025-11-11T19:39:17.148Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-691e-b83b-60fe-50767ffc34a4', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":99}'::jsonb, '{"balance":198}'::jsonb, '100.64.0.2', '2025-11-20T06:42:03.539Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-691e-b881-60fe-50767ffc34b5', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":198}'::jsonb, '{"balance":297}'::jsonb, '100.64.0.2', '2025-11-20T06:43:13.676Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-691e-b89a-60fe-50767ffc34c0', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":297}'::jsonb, '{"balance":397}'::jsonb, '100.64.0.2', '2025-11-20T06:43:38.408Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-691e-b8bd-60fe-50767ffc34cb', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":397}'::jsonb, '{"balance":1397}'::jsonb, '100.64.0.2', '2025-11-20T06:44:13.509Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6925-fbd4-23d5-b6aac28735dd', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":195.5}'::jsonb, '{"balance":5195.5}'::jsonb, '100.64.0.3', '2025-11-25T18:56:20.985Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6927-22ed-4480-22289fe2d542', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":135.5}'::jsonb, '{"balance":5135.5}'::jsonb, '100.64.0.2', '2025-11-26T15:55:25.227Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6928-25b1-4480-22289fe2da2f', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":75.5}'::jsonb, '{"balance":5075.5}'::jsonb, '100.64.0.9', '2025-11-27T10:19:29.330Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6928-a4ea-4480-22289fe2dc2a', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":195.5}'::jsonb, '{"balance":5195.5}'::jsonb, '100.64.0.8', '2025-11-27T19:22:18.718Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6929-6300-4480-22289fe2def8', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":335.5}'::jsonb, '{"balance":5335.5}'::jsonb, '100.64.0.8', '2025-11-28T08:53:20.956Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6929-9c3e-4480-22289fe2dfa5', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":3515.5}'::jsonb, '{"balance":4515.5}'::jsonb, '100.64.0.5', '2025-11-28T12:57:34.240Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-692a-8c79-4480-22289fe2e40b', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '692a8c09448022289fe2e3e2', '{"balance":0}'::jsonb, '{"balance":5000}'::jsonb, '100.64.0.2', '2025-11-29T06:02:33.667Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-692a-d1a8-4480-22289fe2e5f2', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":105.5}'::jsonb, '{"balance":10105.5}'::jsonb, '100.64.0.5', '2025-11-29T10:57:44.423Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-692c-5c4e-4480-22289fe2ee03', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":235.5}'::jsonb, '{"balance":50235.5}'::jsonb, '100.64.0.3', '2025-11-30T15:01:34.245Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-692c-a009-4480-22289fe2ee9d', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '692c9f8b448022289fe2ee77', '{"balance":0}'::jsonb, '{"balance":500}'::jsonb, '100.64.0.5', '2025-11-30T19:50:33.027Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-692e-9d67-4480-22289fe2f597', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '692a8c09448022289fe2e3e2', '{"balance":420}'::jsonb, '{"balance":5420}'::jsonb, '100.64.0.4', '2025-12-02T08:03:51.338Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6932-d23d-fb16-67279ab62f85', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '692929fa448022289fe2dda0', '{"balance":94}'::jsonb, '{"balance":594}'::jsonb, '127.0.0.1', '2025-12-05T12:38:21.966Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6934-b0c9-645f-a7e9b665f40a', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '692a0153448022289fe2e12f', '{"balance":10.899999999999977}'::jsonb, '{"balance":20.899999999999977}'::jsonb, '127.0.0.1', '2025-12-06T22:40:09.930Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6935-4174-c7bf-7630650d3102', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '692a0153448022289fe2e12f', '{"balance":20.899999999999977}'::jsonb, '{"balance":810.9}'::jsonb, '127.0.0.1', '2025-12-07T08:57:24.911Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6935-a7e4-eeea-3fc22a3b5ae3', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '692929fa448022289fe2dda0', '{"balance":134}'::jsonb, '{"balance":634}'::jsonb, '127.0.0.1', '2025-12-07T16:14:28.518Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6936-7e99-eeea-3fc22a3b5bc8', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '692c9f8b448022289fe2ee77', '{"balance":270.5}'::jsonb, '{"balance":1270.5}'::jsonb, '127.0.0.1', '2025-12-08T07:30:33.589Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6937-f6cb-de74-fefd3f965ae5', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '692a8c09448022289fe2e3e2', '{"balance":1420}'::jsonb, '{"balance":11420}'::jsonb, '127.0.0.1', '2025-12-09T10:15:39.010Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6939-4716-de74-fefd3f965e5a', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":166.5}'::jsonb, '{"balance":50166.5}'::jsonb, '127.0.0.1', '2025-12-10T10:10:30.645Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-693c-67c2-de74-fefd3f9663f9', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '692a8c09448022289fe2e3e2', '{"balance":520}'::jsonb, '{"balance":5520}'::jsonb, '127.0.0.1', '2025-12-12T19:06:42.838Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-693e-963c-eeea-3fc22a3b6b77', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '692a8c09448022289fe2e3e2', '{"balance":920}'::jsonb, '{"balance":5920}'::jsonb, '127.0.0.1', '2025-12-14T10:49:32.985Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6942-38f3-de74-fefd3f966d89', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69423820eeea3fc22a3b7094', '{"balance":0}'::jsonb, '{"balance":275}'::jsonb, '127.0.0.1', '2025-12-17T05:00:35.394Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6943-cc66-eeea-3fc22a3b7346', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":6.5}'::jsonb, '{"balance":50006.5}'::jsonb, '127.0.0.1', '2025-12-18T09:41:58.689Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6946-c85b-de74-fefd3f9675b8', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '692720d9448022289fe2d4df', '{"balance":3069.7}'::jsonb, '{"balance":3619.7}'::jsonb, '127.0.0.1', '2025-12-20T16:01:31.592Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6946-f52d-eeea-3fc22a3b7908', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '6946f4c9de74fefd3f96766a', '{"balance":0}'::jsonb, '{"balance":2000}'::jsonb, '127.0.0.1', '2025-12-20T19:12:45.919Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6946-f735-de74-fefd3f9676b0', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '6946f4c9de74fefd3f96766a', '{"balance":1540}'::jsonb, '{"balance":2040}'::jsonb, '127.0.0.1', '2025-12-20T19:21:25.625Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6947-d9ea-eeea-3fc22a3b7af5', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '6946f4c9de74fefd3f96766a', '{"balance":1040}'::jsonb, '{"balance":3040}'::jsonb, '127.0.0.1', '2025-12-21T11:28:42.329Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6948-0c42-de74-fefd3f967871', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '692720d9448022289fe2d4df', '{"balance":3379.7}'::jsonb, '{"balance":3579.7}'::jsonb, '127.0.0.1', '2025-12-21T15:03:30.672Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6949-1bf0-eeea-3fc22a3b7ceb', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69491bcfde74fefd3f9679f1', '{"balance":0}'::jsonb, '{"balance":3040}'::jsonb, '127.0.0.1', '2025-12-22T10:22:40.172Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6949-76f2-de74-fefd3f967b45', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '6947bc81eeea3fc22a3b7aa1', '{"balance":0}'::jsonb, '{"balance":5000}'::jsonb, '127.0.0.1', '2025-12-22T16:50:58.005Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-694a-67d6-eeea-3fc22a3b801e', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69491bcfde74fefd3f9679f1', '{"balance":25}'::jsonb, '{"balance":2525}'::jsonb, '127.0.0.1', '2025-12-23T09:58:46.374Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-694a-a564-de74-fefd3f967e13', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '694aa3fbde74fefd3f967de9', '{"balance":1683}'::jsonb, '{"balance":2453}'::jsonb, '127.0.0.1', '2025-12-23T14:21:24.500Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-694a-e9f6-de74-fefd3f967e7b', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '6939e5f9eeea3fc22a3b62c5', '{"balance":35}'::jsonb, '{"balance":1035}'::jsonb, '127.0.0.1', '2025-12-23T19:13:58.510Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-694a-eea1-eeea-3fc22a3b81fb', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '694aebecde74fefd3f967e85', '{"balance":0}'::jsonb, '{"balance":1000}'::jsonb, '127.0.0.1', '2025-12-23T19:33:53.096Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-694b-ca95-eeea-3fc22a3b83da', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '694aebecde74fefd3f967e85', '{"balance":0}'::jsonb, '{"balance":600}'::jsonb, '127.0.0.1', '2025-12-24T11:12:21.943Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-694c-3ecd-de74-fefd3f9681b1', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69491bcfde74fefd3f9679f1', '{"balance":430}'::jsonb, '{"balance":1230}'::jsonb, '127.0.0.1', '2025-12-24T19:28:13.057Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-694c-3f97-eeea-3fc22a3b851d', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69491bcfde74fefd3f9679f1', '{"balance":310}'::jsonb, '{"balance":810}'::jsonb, '127.0.0.1', '2025-12-24T19:31:35.007Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-694c-441b-de74-fefd3f9681e4', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69491bcfde74fefd3f9679f1', '{"balance":350}'::jsonb, '{"balance":1350}'::jsonb, '127.0.0.1', '2025-12-24T19:50:51.163Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-694d-26be-de74-fefd3f9683f3', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":886.5}'::jsonb, '{"balance":50886.5}'::jsonb, '127.0.0.1', '2025-12-25T11:57:50.228Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-694d-60b6-eeea-3fc22a3b879a', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69491bcfde74fefd3f9679f1', '{"balance":155}'::jsonb, '{"balance":1755}'::jsonb, '127.0.0.1', '2025-12-25T16:05:10.478Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-694e-d098-de74-fefd3f9686ff', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '694aa3fbde74fefd3f967de9', '{"balance":63}'::jsonb, '{"balance":5063}'::jsonb, '127.0.0.1', '2025-12-26T18:14:48.605Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-694e-ebc3-eeea-3fc22a3b8b31', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69491bcfde74fefd3f9679f1', '{"balance":85}'::jsonb, '{"balance":1085}'::jsonb, '127.0.0.1', '2025-12-26T20:10:43.053Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6950-0635-de74-fefd3f968a13', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '694aebecde74fefd3f967e85', '{"balance":40}'::jsonb, '{"balance":1540}'::jsonb, '127.0.0.1', '2025-12-27T16:15:49.321Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6951-0c81-de74-fefd3f968cde', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69491bcfde74fefd3f9679f1', '{"balance":385}'::jsonb, '{"balance":2685}'::jsonb, '127.0.0.1', '2025-12-28T10:54:57.212Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6951-8b54-de74-fefd3f968e25', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '694aebecde74fefd3f967e85', '{"balance":425}'::jsonb, '{"balance":925}'::jsonb, '127.0.0.1', '2025-12-28T19:56:04.324Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6953-971c-eeea-3fc22a3b96ba', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '694aa3fbde74fefd3f967de9', '{"balance":373}'::jsonb, '{"balance":5473}'::jsonb, '127.0.0.1', '2025-12-30T09:10:52.976Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6954-2986-eeea-3fc22a3b9878', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69491bcfde74fefd3f9679f1', '{"balance":105}'::jsonb, '{"balance":605}'::jsonb, '127.0.0.1', '2025-12-30T19:35:34.114Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6954-357d-eeea-3fc22a3b98e1', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69491bcfde74fefd3f9679f1', '{"balance":55}'::jsonb, '{"balance":655}'::jsonb, '127.0.0.1', '2025-12-30T20:26:37.509Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6955-0fce-de74-fefd3f969840', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":1121.5}'::jsonb, '{"balance":51121.5}'::jsonb, '127.0.0.1', '2025-12-31T11:58:06.529Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6955-91fb-6221-f213880fa1cb', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69491bcfde74fefd3f9679f1', '{"balance":95}'::jsonb, '{"balance":595}'::jsonb, '127.0.0.1', '2025-12-31T21:13:31.478Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6956-c69d-8b59-d9ec2102f812', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69491bcfde74fefd3f9679f1', '{"balance":135}'::jsonb, '{"balance":735}'::jsonb, '127.0.0.1', '2026-01-01T19:10:21.444Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6956-e48a-6221-f213880fa626', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69491bcfde74fefd3f9679f1', '{"balance":460}'::jsonb, '{"balance":1460}'::jsonb, '127.0.0.1', '2026-01-01T21:18:02.776Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6958-036c-8b59-d9ec2102fb37', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '694aa3fbde74fefd3f967de9', '{"balance":85.30000000000018}'::jsonb, '{"balance":3085.3}'::jsonb, '127.0.0.1', '2026-01-02T17:42:04.725Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6958-e3fe-6221-f213880fa9fa', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '694aa3fbde74fefd3f967de9', '{"balance":50.30000000000018}'::jsonb, '{"balance":2050.3}'::jsonb, '127.0.0.1', '2026-01-03T09:40:14.007Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-695a-1c18-8b59-d9ec2103017e', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '695a1b6b8b59d9ec21030167', '{"balance":0}'::jsonb, '{"balance":460}'::jsonb, '127.0.0.1', '2026-01-04T07:51:52.625Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-695a-72bb-8b59-d9ec210302ce', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '695a70ab6221f213880faef4', '{"balance":0}'::jsonb, '{"balance":1000}'::jsonb, '127.0.0.1', '2026-01-04T14:01:31.500Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-695a-d54d-6221-f213880fb2cd', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69491bcfde74fefd3f9679f1', '{"balance":446}'::jsonb, '{"balance":1146}'::jsonb, '127.0.0.1', '2026-01-04T21:02:05.823Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-695b-d402-6221-f213880fb57f', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '692720d9448022289fe2d4df', '{"balance":32.43999999999983}'::jsonb, '{"balance":5032.44}'::jsonb, '127.0.0.1', '2026-01-05T15:08:50.457Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-695b-d544-6221-f213880fb586', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '692720d9448022289fe2d4df', '{"balance":5032.44}'::jsonb, '{"balance":5182.44}'::jsonb, '127.0.0.1', '2026-01-05T15:14:12.986Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-695c-2942-6221-f213880fb761', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69491bcfde74fefd3f9679f1', '{"balance":1471}'::jsonb, '{"balance":2571}'::jsonb, '127.0.0.1', '2026-01-05T21:12:34.418Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-695c-33d0-8b59-d9ec21030aef', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69491bcfde74fefd3f9679f1', '{"balance":1651}'::jsonb, '{"balance":3151}'::jsonb, '127.0.0.1', '2026-01-05T21:57:36.382Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-695d-4e5e-8b59-d9ec21030cf1', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '692720d9448022289fe2d4df', '{"balance":4722.44}'::jsonb, '{"balance":5222.44}'::jsonb, '127.0.0.1', '2026-01-06T18:03:10.488Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-695d-8539-6221-f213880fbb37', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '692720d9448022289fe2d4df', '{"balance":4762.44}'::jsonb, '{"balance":5312.44}'::jsonb, '127.0.0.1', '2026-01-06T21:57:13.213Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-695e-9e9c-6221-f213880fbd7a', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69491bcfde74fefd3f9679f1', '{"balance":246}'::jsonb, '{"balance":2046}'::jsonb, '127.0.0.1', '2026-01-07T17:57:48.319Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-695e-aba3-6221-f213880fbda8', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69491bcfde74fefd3f9679f1', '{"balance":366}'::jsonb, '{"balance":2366}'::jsonb, '127.0.0.1', '2026-01-07T18:53:23.698Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6960-136b-8b59-d9ec21031561', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '6952c4b3de74fefd3f9691d1', '{"balance":99}'::jsonb, '{"balance":2199}'::jsonb, '127.0.0.1', '2026-01-08T20:28:27.503Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6960-dbb2-8b59-d9ec210316fb', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":11.5}'::jsonb, '{"balance":50011.5}'::jsonb, '127.0.0.1', '2026-01-09T10:42:58.765Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6961-433f-8b59-d9ec21031890', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '694aa3fbde74fefd3f967de9', '{"balance":210.30000000000018}'::jsonb, '{"balance":3210.3}'::jsonb, '127.0.0.1', '2026-01-09T18:04:47.676Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6964-0d93-8b59-d9ec210321ce', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69491bcfde74fefd3f9679f1', '{"balance":361}'::jsonb, '{"balance":861}'::jsonb, '127.0.0.1', '2026-01-11T20:52:35.015Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6964-a323-8b59-d9ec21032243', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '692720d9448022289fe2d4df', '{"balance":2914.0499999999997}'::jsonb, '{"balance":3614.0499999999997}'::jsonb, '127.0.0.1', '2026-01-12T07:30:43.025Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6965-5fd5-8b59-d9ec210324c9', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '694aa3fbde74fefd3f967de9', '{"balance":195.30000000000018}'::jsonb, '{"balance":2195.3}'::jsonb, '127.0.0.1', '2026-01-12T20:55:49.497Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6967-94c0-e4d4-252b361329c4', '00000000-6953-01eb-2328-8670bbff4d5a', NULL, 'api_key_generated', 'User', '69274b47448022289fe2d5ee', NULL, '{"api_key_enabled":true}'::jsonb, '127.0.0.1', '2026-01-14T13:06:08.368Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6967-957f-f32c-57d5530d77e1', '00000000-6953-01eb-2328-8670bbff4d5a', NULL, 'api_key_revoked', 'User', '69274b47448022289fe2d5ee', NULL, '{"api_key_enabled":false}'::jsonb, '127.0.0.1', '2026-01-14T13:09:19.645Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6967-a461-e93c-c81fa3705996', '00000000-6953-01eb-2328-8670bbff4d5a', NULL, 'api_key_generated', 'User', '69274b47448022289fe2d5ee', NULL, '{"api_key_enabled":true}'::jsonb, '127.0.0.1', '2026-01-14T14:12:49.895Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6967-ab57-c400-bd5c9a23117a', '00000000-6953-01eb-2328-8670bbff4d5a', NULL, 'api_key_revoked', 'User', '69274b47448022289fe2d5ee', NULL, '{"api_key_enabled":false}'::jsonb, '127.0.0.1', '2026-01-14T14:42:31.069Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6967-ab59-c400-bd5c9a23117e', '00000000-6953-01eb-2328-8670bbff4d5a', NULL, 'api_key_generated', 'User', '69274b47448022289fe2d5ee', NULL, '{"api_key_enabled":true}'::jsonb, '127.0.0.1', '2026-01-14T14:42:33.595Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6967-ad4b-62b5-a342cdffd401', '00000000-6913-575a-dc7e-471b13d32a9e', NULL, 'api_key_revoked', 'User', '69274b47448022289fe2d5ee', NULL, '{"api_key_enabled":false}'::jsonb, '127.0.0.1', '2026-01-14T14:50:51.387Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6967-ad4d-62b5-a342cdffd405', '00000000-6913-575a-dc7e-471b13d32a9e', NULL, 'api_key_generated', 'User', '69274b47448022289fe2d5ee', NULL, '{"api_key_enabled":true}'::jsonb, '127.0.0.1', '2026-01-14T14:50:53.261Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6967-b73b-b685-79429ac2bcaf', '00000000-6953-01eb-2328-8670bbff4d5a', NULL, 'api_key_revoked', 'User', '69274b47448022289fe2d5ee', NULL, '{"api_key_enabled":false}'::jsonb, '127.0.0.1', '2026-01-14T15:33:15.660Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6967-b73e-b685-79429ac2bcb3', '00000000-6953-01eb-2328-8670bbff4d5a', NULL, 'api_key_generated', 'User', '69274b47448022289fe2d5ee', NULL, '{"api_key_enabled":true}'::jsonb, '127.0.0.1', '2026-01-14T15:33:18.068Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6968-9dfa-4f2d-f5e341b369fb', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '694aa3fbde74fefd3f967de9', '{"balance":20.300000000000182}'::jsonb, '{"balance":3020.3}'::jsonb, '127.0.0.1', '2026-01-15T07:57:46.893Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6968-c6eb-27eb-059addcfcbd6', '00000000-6953-01eb-2328-8670bbff4d5a', NULL, 'api_key_generated', 'User', '6912fc2413ca4b97ddad1754', NULL, '{"api_key_enabled":true}'::jsonb, '127.0.0.1', '2026-01-15T10:52:27.585Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6969-5043-e751-5e1550bdf550', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":396.5}'::jsonb, '{"balance":50396.5}'::jsonb, '127.0.0.1', '2026-01-15T20:38:27.992Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6969-d8a8-27eb-059addcfce8c', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '692720d9448022289fe2d4df', '{"balance":2394.0499999999997}'::jsonb, '{"balance":2694.0499999999997}'::jsonb, '127.0.0.1', '2026-01-16T06:20:24.862Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-696a-96f4-27eb-059addcfd338', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69491bcfde74fefd3f9679f1', '{"balance":893}'::jsonb, '{"balance":1893}'::jsonb, '127.0.0.1', '2026-01-16T19:52:20.344Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-696d-0dce-27eb-059addcfd8fd', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '692720d9448022289fe2d4df', '{"balance":1829.5499999999997}'::jsonb, '{"balance":3829.5499999999997}'::jsonb, '127.0.0.1', '2026-01-18T16:43:58.346Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-696d-236b-27eb-059addcfd92c', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'user_status_updated', 'User', '69274b47448022289fe2d5ee', '{"status":"active"}'::jsonb, '{"status":"inactive"}'::jsonb, '127.0.0.1', '2026-01-18T18:16:11.505Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-696d-237c-27eb-059addcfd932', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'user_status_updated', 'User', '69274b47448022289fe2d5ee', '{"status":"inactive"}'::jsonb, '{"status":"active"}'::jsonb, '127.0.0.1', '2026-01-18T18:16:28.760Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-696d-5680-e751-5e1550be019d', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69491bcfde74fefd3f9679f1', '{"balance":105}'::jsonb, '{"balance":1405}'::jsonb, '127.0.0.1', '2026-01-18T21:54:08.401Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-696e-0558-e751-5e1550be0228', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'user_status_updated', 'User', '69274b47448022289fe2d5ee', '{"status":"active"}'::jsonb, '{"status":"inactive"}'::jsonb, '127.0.0.1', '2026-01-19T10:20:08.459Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-696e-05a0-27eb-059addcfdb59', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'user_status_updated', 'User', '691c8e9c0905272b76d063c7', '{"status":"active"}'::jsonb, '{"status":"inactive"}'::jsonb, '127.0.0.1', '2026-01-19T10:21:20.080Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-696e-05c4-27eb-059addcfdb73', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'user_status_updated', 'User', '691c8e9c0905272b76d063c7', '{"status":"inactive"}'::jsonb, '{"status":"active"}'::jsonb, '127.0.0.1', '2026-01-19T10:21:56.001Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-696e-1bf3-e751-5e1550be02be', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '6953d3b2de74fefd3f969451', '{"balance":145.19999999999982}'::jsonb, '{"balance":645.1999999999998}'::jsonb, '127.0.0.1', '2026-01-19T11:56:35.859Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6973-b694-e751-5e1550be0dd3', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":1856.5}'::jsonb, '{"balance":51856.5}'::jsonb, '127.0.0.1', '2026-01-23T17:57:40.644Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6976-681a-27eb-059addcfefc2', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69491bcfde74fefd3f9679f1', '{"balance":486.20000000000005}'::jsonb, '{"balance":986.2}'::jsonb, '127.0.0.1', '2026-01-25T18:59:38.616Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6977-773c-27eb-059addcff481', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '694aa3fbde74fefd3f967de9', '{"balance":365.3000000000002}'::jsonb, '{"balance":3365.3}'::jsonb, '127.0.0.1', '2026-01-26T14:16:28.686Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-697a-56aa-e751-5e1550be22b2', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":42.5}'::jsonb, '{"balance":50042.5}'::jsonb, '127.0.0.1', '2026-01-28T18:34:18.284Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-697b-ce48-27eb-059addcfffa8', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '6953d3b2de74fefd3f969451', '{"balance":451.3299999999997}'::jsonb, '{"balance":586.3299999999997}'::jsonb, '127.0.0.1', '2026-01-29T21:16:56.097Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6982-47ae-e751-5e1550be41de', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":571}'::jsonb, '{"balance":50571}'::jsonb, '127.0.0.1', '2026-02-03T19:08:30.370Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6982-d539-27eb-059addd01d27', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'user_status_updated', 'User', '6982273ce7515e1550be416a', '{"status":"active"}'::jsonb, '{"status":"inactive"}'::jsonb, '127.0.0.1', '2026-02-04T05:12:25.880Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6982-d540-27eb-059addd01d2b', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'user_status_updated', 'User', '6982273ce7515e1550be416a', '{"status":"inactive"}'::jsonb, '{"status":"active"}'::jsonb, '127.0.0.1', '2026-02-04T05:12:32.388Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6982-d563-27eb-059addd01d31', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'user_status_updated', 'User', '698255f2e7515e1550be4220', '{"status":"active"}'::jsonb, '{"status":"active"}'::jsonb, '127.0.0.1', '2026-02-04T05:13:07.804Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6984-e067-27eb-059addd027e4', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'user_status_updated', 'User', '6984b76e27eb059addd0265a', '{"status":"active"}'::jsonb, '{"status":"inactive"}'::jsonb, '127.0.0.1', '2026-02-05T18:24:39.461Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6984-e148-e751-5e1550be4de5', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'user_status_updated', 'User', '6984b752e7515e1550be4c41', '{"status":"active"}'::jsonb, '{"status":"inactive"}'::jsonb, '127.0.0.1', '2026-02-05T18:28:24.149Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6985-a2b2-27eb-059addd02adf', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'user_status_updated', 'User', '6984b752e7515e1550be4c41', '{"status":"inactive"}'::jsonb, '{"status":"active"}'::jsonb, '127.0.0.1', '2026-02-06T08:13:38.370Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6985-a2d8-e751-5e1550be517c', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'user_status_updated', 'User', '6984b752e7515e1550be4c41', '{"status":"active"}'::jsonb, '{"status":"inactive"}'::jsonb, '127.0.0.1', '2026-02-06T08:14:16.500Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6986-0adb-e751-5e1550be52d8', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '694aa3fbde74fefd3f967de9', '{"balance":95.30000000000018}'::jsonb, '{"balance":5095.3}'::jsonb, '127.0.0.1', '2026-02-06T15:38:03.867Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6986-fe85-27eb-059addd0313c', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69848620e7515e1550be4a78', '{"balance":9138.800000000001}'::jsonb, '{"balance":9438.800000000001}'::jsonb, '127.0.0.1', '2026-02-07T08:57:41.177Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6989-7b3e-e751-5e1550be630c', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":75}'::jsonb, '{"balance":100075}'::jsonb, '127.0.0.1', '2026-02-09T06:14:22.584Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-698a-e995-19f2-0ddc42aae780', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '697f153ee7515e1550be354c', '{"balance":42}'::jsonb, '{"balance":542}'::jsonb, '127.0.0.1', '2026-02-10T08:17:25.473Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-698b-3e7b-19f2-0ddc42aaeb56', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '698b3dd919f20ddc42aaeb36', '{"balance":0}'::jsonb, '{"balance":1000}'::jsonb, '127.0.0.1', '2026-02-10T14:19:39.047Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-698c-7c08-19f2-0ddc42aaf077', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69847921e7515e1550be4a1f', '{"balance":145}'::jsonb, '{"balance":445}'::jsonb, '127.0.0.1', '2026-02-11T12:54:32.556Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-698c-831c-494b-caf1612616a5', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '6953d3b2de74fefd3f969451', '{"balance":271.52999999999975}'::jsonb, '{"balance":1271.5299999999997}'::jsonb, '127.0.0.1', '2026-02-11T13:24:44.939Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-698e-3b56-19f2-0ddc42aaf9b7', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '694aa3fbde74fefd3f967de9', '{"balance":70.30000000000018}'::jsonb, '{"balance":1920.3000000000002}'::jsonb, '127.0.0.1', '2026-02-12T20:43:02.247Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6995-ebec-494b-caf161263d18', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'api_key_generated', 'User', '691c8e9c0905272b76d063c7', NULL, '{"api_key_enabled":true}'::jsonb, '127.0.0.1', '2026-02-18T16:42:20.332Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6995-ec01-494b-caf161263d1c', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'api_key_revoked', 'User', '691c8e9c0905272b76d063c7', NULL, '{"api_key_enabled":false}'::jsonb, '127.0.0.1', '2026-02-18T16:42:41.945Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-699b-581a-19f2-0ddc42ab2b88', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":198.5}'::jsonb, '{"balance":20198.5}'::jsonb, '127.0.0.1', '2026-02-22T19:25:14.051Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-699b-6f4f-494b-caf161265607', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '695a6b8f8b59d9ec21030256', '{"balance":903.3999999999996}'::jsonb, '{"balance":5903.4}'::jsonb, '127.0.0.1', '2026-02-22T21:04:15.826Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-699e-e79a-4141-dbfa7e098ea1', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69722d54e7515e1550be0b11', '{"balance":53.65000000000009}'::jsonb, '{"balance":1553.65}'::jsonb, '127.0.0.1', '2026-02-25T12:14:18.171Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-699e-e8a6-4141-dbfa7e098f23', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '6978bb39e7515e1550be1f48', '{"balance":127.40000000000009}'::jsonb, '{"balance":498.4000000000001}'::jsonb, '127.0.0.1', '2026-02-25T12:18:46.852Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-699e-ea11-4141-dbfa7e098f5c', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69847921e7515e1550be4a1f', '{"balance":31}'::jsonb, '{"balance":531}'::jsonb, '127.0.0.1', '2026-02-25T12:24:49.068Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-699e-eb52-4141-dbfa7e098f8b', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '697f0bdbe7515e1550be352b', '{"balance":49.200000000000045}'::jsonb, '{"balance":349.20000000000005}'::jsonb, '127.0.0.1', '2026-02-25T12:30:10.342Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-699e-eb8f-4141-dbfa7e098fbc', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '692720d9448022289fe2d4df', '{"balance":1.7497999999995955}'::jsonb, '{"balance":1251.7497999999996}'::jsonb, '127.0.0.1', '2026-02-25T12:31:11.032Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-699e-f6d6-4141-dbfa7e099166', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '6954417cde74fefd3f96961f', '{"balance":70.5}'::jsonb, '{"balance":2050.5}'::jsonb, '127.0.0.1', '2026-02-25T13:19:18.871Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-699e-f808-4141-dbfa7e0991cb', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '6935d8aade74fefd3f965892', '{"balance":11.150000000000318}'::jsonb, '{"balance":461.1500000000003}'::jsonb, '127.0.0.1', '2026-02-25T13:24:24.101Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-699e-fba5-4141-dbfa7e09927d', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '698b37c019f20ddc42aaeaf9', '{"balance":9.399999999999864}'::jsonb, '{"balance":306.39999999999986}'::jsonb, '127.0.0.1', '2026-02-25T13:39:49.890Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-699e-fcd8-4141-dbfa7e0992ce', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '6984abac27eb059addd025c9', '{"balance":633}'::jsonb, '{"balance":1128}'::jsonb, '127.0.0.1', '2026-02-25T13:44:56.985Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-699f-219f-4141-dbfa7e099510', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '6994083e19f20ddc42ab0efd', '{"balance":95.5}'::jsonb, '{"balance":545.5}'::jsonb, '127.0.0.1', '2026-02-25T16:21:51.477Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-699f-508b-4141-dbfa7e09967c', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '695a81286221f213880faf5f', '{"balance":4.769999999999982}'::jsonb, '{"balance":454.77}'::jsonb, '127.0.0.1', '2026-02-25T19:42:03.258Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-699f-5ae4-4141-dbfa7e09975c', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":642.6999999999998}'::jsonb, '{"balance":10642.7}'::jsonb, '127.0.0.1', '2026-02-25T20:26:12.411Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-699f-5c6a-4141-dbfa7e09979f', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '692720d9448022289fe2d4df', '{"balance":951.7497999999996}'::jsonb, '{"balance":1951.7497999999996}'::jsonb, '127.0.0.1', '2026-02-25T20:32:42.723Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-699f-c5aa-4141-dbfa7e099adf', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '694aebecde74fefd3f967e85', '{"balance":64.50999999999976}'::jsonb, '{"balance":1054.5099999999998}'::jsonb, '127.0.0.1', '2026-02-26T04:01:46.970Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69a0-40f3-4141-dbfa7e099e95', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69847921e7515e1550be4a1f', '{"balance":36.5}'::jsonb, '{"balance":436.5}'::jsonb, '127.0.0.1', '2026-02-26T12:47:47.581Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69a0-acf1-4141-dbfa7e09a35a', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":8.200000000000728}'::jsonb, '{"balance":10008.2}'::jsonb, '127.0.0.1', '2026-02-26T20:28:33.529Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69a1-e640-4141-dbfa7e09ac4a', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":290.2000000000007}'::jsonb, '{"balance":10290.2}'::jsonb, '127.0.0.1', '2026-02-27T18:45:20.335Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69a2-e61a-4141-dbfa7e09b4e8', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":591.6000000000008}'::jsonb, '{"balance":10591.6}'::jsonb, '127.0.0.1', '2026-02-28T12:56:58.054Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69a4-5b6b-2a6b-f5607f362911', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":422.10000000000036}'::jsonb, '{"balance":10422.1}'::jsonb, '127.0.0.1', '2026-03-01T15:29:47.594Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69a4-9d63-2a6b-f5607f362c05', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '692720d9448022289fe2d4df', '{"balance":970.3497999999995}'::jsonb, '{"balance":1470.3497999999995}'::jsonb, '127.0.0.1', '2026-03-01T20:11:15.416Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69a5-b1f2-2a6b-f5607f363470', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '692720d9448022289fe2d4df', '{"balance":370.7297999999995}'::jsonb, '{"balance":1370.7297999999996}'::jsonb, '127.0.0.1', '2026-03-02T15:51:14.738Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69a5-d92a-2a6b-f5607f3635de', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":385.60000000000036}'::jsonb, '{"balance":10385.6}'::jsonb, '127.0.0.1', '2026-03-02T18:38:34.305Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69a6-f1b8-2a6b-f5607f36405e', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69847921e7515e1550be4a1f', '{"balance":31.30000000000019}'::jsonb, '{"balance":531.3000000000002}'::jsonb, '127.0.0.1', '2026-03-03T14:35:36.243Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69a7-0226-2a6b-f5607f364207', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69847921e7515e1550be4a1f', '{"balance":85.80000000000014}'::jsonb, '{"balance":1085.8000000000002}'::jsonb, '127.0.0.1', '2026-03-03T15:45:42.533Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69a7-45e0-17bc-f54fb116a31f', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":16.100000000000364}'::jsonb, '{"balance":10016.1}'::jsonb, '127.0.0.1', '2026-03-03T20:34:40.160Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69a8-93d4-17bc-f54fb116aa3f', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":698.1000000000004}'::jsonb, '{"balance":10698.1}'::jsonb, '127.0.0.1', '2026-03-04T20:19:32.473Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69a8-aa42-17bc-f54fb116ac84', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '692720d9448022289fe2d4df', '{"balance":3.329799999999409}'::jsonb, '{"balance":503.3297999999994}'::jsonb, '127.0.0.1', '2026-03-04T21:55:14.217Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69a9-f4b8-17bc-f54fb116b82e', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":448.10000000000036}'::jsonb, '{"balance":10448.1}'::jsonb, '127.0.0.1', '2026-03-05T21:25:12.927Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69aa-aa36-17bc-f54fb116bc9b', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69aaa70e17bcf54fb116bc4e', '{"balance":0}'::jsonb, '{"balance":500}'::jsonb, '127.0.0.1', '2026-03-06T10:19:34.366Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69aa-c3c3-17bc-f54fb116bf5c', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69aabd4417bcf54fb116bf1a', '{"balance":0}'::jsonb, '{"balance":150}'::jsonb, '127.0.0.1', '2026-03-06T12:08:35.883Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69ab-2d43-17bc-f54fb116c33e', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":78.60000000000036}'::jsonb, '{"balance":10078.6}'::jsonb, '127.0.0.1', '2026-03-06T19:38:43.051Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69ac-85f2-17bc-f54fb116cf1b', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":948.1000000000004}'::jsonb, '{"balance":10948.1}'::jsonb, '127.0.0.1', '2026-03-07T20:09:22.328Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69ad-d49a-17bc-f54fb116d78f', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":829.1000000000004}'::jsonb, '{"balance":10829.1}'::jsonb, '127.0.0.1', '2026-03-08T19:57:14.424Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69ae-0538-17bc-f54fb116dafd', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '692720d9448022289fe2d4df', '{"balance":120.41829999999948}'::jsonb, '{"balance":620.4182999999995}'::jsonb, '127.0.0.1', '2026-03-08T23:24:40.791Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69af-4a57-7264-b5316c0ad3ad', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":159.60000000000036}'::jsonb, '{"balance":10159.6}'::jsonb, '127.0.0.1', '2026-03-09T22:31:51.844Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69b1-3b1d-7264-b5316c0ae304', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":48.100000000000364}'::jsonb, '{"balance":20048.1}'::jsonb, '127.0.0.1', '2026-03-11T09:51:25.812Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69b3-e8a1-7264-b5316c0afb9d', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":351.4999999999927}'::jsonb, '{"balance":10351.499999999993}'::jsonb, '127.0.0.1', '2026-03-13T10:36:17.810Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69b5-161a-7264-b5316c0b032c', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":530.9999999999927}'::jsonb, '{"balance":10530.999999999993}'::jsonb, '127.0.0.1', '2026-03-14T08:02:34.171Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69b5-c1ec-7264-b5316c0b0827', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '692720d9448022289fe2d4df', '{"balance":12.118299999999465}'::jsonb, '{"balance":1212.1182999999994}'::jsonb, '127.0.0.1', '2026-03-14T20:15:40.437Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69b5-dc9b-7264-b5316c0b0a2f', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":172.99999999999272}'::jsonb, '{"balance":10172.999999999993}'::jsonb, '127.0.0.1', '2026-03-14T22:09:31.320Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69b7-1ede-7264-b5316c0b102e', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '6935d8aade74fefd3f965892', '{"balance":92.15000000000032}'::jsonb, '{"balance":1092.1500000000003}'::jsonb, '127.0.0.1', '2026-03-15T21:04:30.684Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69b8-5dcf-7264-b5316c0b173c', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":13.499999999992724}'::jsonb, '{"balance":10013.499999999993}'::jsonb, '127.0.0.1', '2026-03-16T19:45:19.654Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69b8-d20e-7264-b5316c0b1ad1', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '692720d9448022289fe2d4df', '{"balance":46.61829999999941}'::jsonb, '{"balance":6146.618299999999}'::jsonb, '127.0.0.1', '2026-03-17T04:01:18.294Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69b9-d53e-7264-b5316c0b21a7', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":7.299999999992721}'::jsonb, '{"balance":10007.299999999992}'::jsonb, '127.0.0.1', '2026-03-17T22:27:10.559Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69bc-4241-7264-b5316c0b2f12', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":9.299999999991996}'::jsonb, '{"balance":10009.299999999992}'::jsonb, '127.0.0.1', '2026-03-19T18:36:49.540Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69bd-bbf1-7264-b5316c0b41ff', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":190.299999999992}'::jsonb, '{"balance":10190.299999999992}'::jsonb, '127.0.0.1', '2026-03-20T21:28:17.371Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69bf-0ee6-7264-b5316c0b4c9a', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":5.2999999999919964}'::jsonb, '{"balance":10005.299999999992}'::jsonb, '127.0.0.1', '2026-03-21T21:34:30.846Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69c0-27cf-7264-b5316c0b5563', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":105.299999999992}'::jsonb, '{"balance":10105.299999999992}'::jsonb, '127.0.0.1', '2026-03-22T17:33:03.120Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69c0-5deb-7264-b5316c0b5ac1', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '6935d8aade74fefd3f965892', '{"balance":396.1500000000003}'::jsonb, '{"balance":1396.1500000000003}'::jsonb, '127.0.0.1', '2026-03-22T21:23:55.636Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69c1-196f-7264-b5316c0b5e5d', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":143.09999999999127}'::jsonb, '{"balance":10143.099999999991}'::jsonb, '127.0.0.1', '2026-03-23T10:43:59.779Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69c1-befa-7264-b5316c0b653b', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":11.099999999991269}'::jsonb, '{"balance":10011.099999999991}'::jsonb, '127.0.0.1', '2026-03-23T22:30:18.182Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69c2-87b4-7264-b5316c0b68ff', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '6954417cde74fefd3f96961f', '{"balance":1802.5}'::jsonb, '{"balance":2802.5}'::jsonb, '127.0.0.1', '2026-03-24T12:46:44.244Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69c2-f073-7264-b5316c0b6c7e', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":261.09999999999127}'::jsonb, '{"balance":10261.099999999991}'::jsonb, '127.0.0.1', '2026-03-24T20:13:39.715Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69c4-241c-7264-b5316c0b75ad', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":439.59999999999127}'::jsonb, '{"balance":10439.599999999991}'::jsonb, '127.0.0.1', '2026-03-25T18:06:20.059Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69c6-4549-7264-b5316c0b7e89', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":169.59999999999127}'::jsonb, '{"balance":10169.599999999991}'::jsonb, '127.0.0.1', '2026-03-27T08:52:25.892Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69c6-e1a4-7264-b5316c0b8286', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":136.59999999999127}'::jsonb, '{"balance":10136.599999999991}'::jsonb, '127.0.0.1', '2026-03-27T19:59:32.649Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69c8-d08d-7264-b5316c0b8bac', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":326.59999999999127}'::jsonb, '{"balance":10326.599999999991}'::jsonb, '127.0.0.1', '2026-03-29T07:11:09.954Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69ca-92c2-7264-b5316c0b95ca', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":73.59999999999127}'::jsonb, '{"balance":573.5999999999913}'::jsonb, '127.0.0.1', '2026-03-30T15:12:02.476Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69ca-bb84-7264-b5316c0b9654', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":123.59999999999127}'::jsonb, '{"balance":10123.599999999991}'::jsonb, '127.0.0.1', '2026-03-30T18:05:56.208Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69cb-f846-7264-b5316c0b9ccd', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":124.59999999999127}'::jsonb, '{"balance":10124.599999999991}'::jsonb, '127.0.0.1', '2026-03-31T16:37:26.514Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69cd-2b68-7264-b5316c0ba5a2', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":107.59999999999127}'::jsonb, '{"balance":10107.599999999991}'::jsonb, '127.0.0.1', '2026-04-01T14:27:52.246Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69ce-7e33-7264-b5316c0bacb6', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":9.599999999991269}'::jsonb, '{"balance":10009.599999999991}'::jsonb, '127.0.0.1', '2026-04-02T14:33:23.731Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69cf-d9de-7264-b5316c0bb4f1', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":447.59999999999127}'::jsonb, '{"balance":10447.599999999991}'::jsonb, '127.0.0.1', '2026-04-03T15:16:46.985Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69d1-6172-7264-b5316c0bbe0f', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":142.59999999999127}'::jsonb, '{"balance":10142.599999999991}'::jsonb, '127.0.0.1', '2026-04-04T19:07:30.773Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69d2-ba68-7264-b5316c0bc68e', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":210.59999999999127}'::jsonb, '{"balance":10210.599999999991}'::jsonb, '127.0.0.1', '2026-04-05T19:39:20.514Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69d4-c3b0-7264-b5316c0bcf66', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":40.59999999999127}'::jsonb, '{"balance":10040.599999999991}'::jsonb, '127.0.0.1', '2026-04-07T08:43:28.549Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69d6-b45e-7264-b5316c0bdbb0', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":440.59999999999127}'::jsonb, '{"balance":10440.599999999991}'::jsonb, '127.0.0.1', '2026-04-08T20:02:38.988Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69d8-2c6e-7264-b5316c0be62c', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":190.59999999999127}'::jsonb, '{"balance":10190.599999999991}'::jsonb, '127.0.0.1', '2026-04-09T22:47:10.364Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69d9-556e-7264-b5316c0bea5b', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":324.59999999999127}'::jsonb, '{"balance":10324.599999999991}'::jsonb, '127.0.0.1', '2026-04-10T19:54:22.203Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69db-b4e3-7264-b5316c0bf391', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":1043.5999999999913}'::jsonb, '{"balance":11043.599999999991}'::jsonb, '127.0.0.1', '2026-04-12T15:06:11.156Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69de-5c25-7264-b5316c0c02f9', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":439.09999999999127}'::jsonb, '{"balance":10439.099999999991}'::jsonb, '127.0.0.1', '2026-04-14T15:24:21.289Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69df-8182-73c6-958a017cebf5', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":84.59999999999127}'::jsonb, '{"balance":100084.59999999999}'::jsonb, '127.0.0.1', '2026-04-15T12:16:02.983Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69e7-5648-e7b1-502cb10e7924', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":0}'::jsonb, '{"balance":300}'::jsonb, '127.0.0.1', '2026-04-21T10:49:44.528Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69e7-76c1-1b83-c92d320434f3', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":15}'::jsonb, '{"balance":5015}'::jsonb, '127.0.0.1', '2026-04-21T13:08:17.589Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69e7-776b-1b83-c92d32043521', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69e4df9b73c6958a017d16ea', '{"balance":0}'::jsonb, '{"balance":495}'::jsonb, '127.0.0.1', '2026-04-21T13:11:07.533Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69e7-8179-1b83-c92d320435e7', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '692bd473448022289fe2eac8', '{"balance":445.5}'::jsonb, '{"balance":890.5}'::jsonb, '127.0.0.1', '2026-04-21T13:54:01.341Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69e7-819a-1b83-c92d320435fe', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '695a6b8f8b59d9ec21030256', '{"balance":1980}'::jsonb, '{"balance":3960}'::jsonb, '127.0.0.1', '2026-04-21T13:54:34.812Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69e7-81bf-1b83-c92d3204360c', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '698b37c019f20ddc42aaeaf9', '{"balance":0}'::jsonb, '{"balance":425.5}'::jsonb, '127.0.0.1', '2026-04-21T13:55:11.509Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69e7-8207-1b83-c92d32043627', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '694aa3fbde74fefd3f967de9', '{"balance":0}'::jsonb, '{"balance":4128.3}'::jsonb, '127.0.0.1', '2026-04-21T13:56:23.342Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69e7-8590-1b83-c92d32043674', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69cf7d447264b5316c0bb281', '{"balance":0}'::jsonb, '{"balance":540}'::jsonb, '127.0.0.1', '2026-04-21T14:11:28.650Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69e7-85a8-1b83-c92d3204367e', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '6935d8aade74fefd3f965892', '{"balance":0}'::jsonb, '{"balance":495}'::jsonb, '127.0.0.1', '2026-04-21T14:11:52.700Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69e7-bd18-1b83-c92d32043924', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":68}'::jsonb, '{"balance":10068}'::jsonb, '127.0.0.1', '2026-04-21T18:08:24.211Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69e7-bf73-1b83-c92d32043993', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69848620e7515e1550be4a78', '{"balance":0}'::jsonb, '{"balance":8000}'::jsonb, '127.0.0.1', '2026-04-21T18:18:27.225Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69e7-ed53-1b83-c92d32043c64', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69aabd4417bcf54fb116bf1a', '{"balance":0}'::jsonb, '{"balance":400}'::jsonb, '127.0.0.1', '2026-04-21T21:34:11.498Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69e7-ed68-1b83-c92d32043c75', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69aabd4417bcf54fb116bf1a', '{"balance":400}'::jsonb, '{"balance":750}'::jsonb, '127.0.0.1', '2026-04-21T21:34:32.953Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69e8-a132-1b83-c92d32043f1a', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69e8a0cc1b83c92d32043ebe', '{"balance":0}'::jsonb, '{"balance":300}'::jsonb, '127.0.0.1', '2026-04-22T10:21:38.383Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69e9-1108-1b83-c92d320441fe', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":73}'::jsonb, '{"balance":10073}'::jsonb, '127.0.0.1', '2026-04-22T18:18:48.792Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69e9-3bcf-1b83-c92d3204442a', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '695a81286221f213880faf5f', '{"balance":0}'::jsonb, '{"balance":500}'::jsonb, '127.0.0.1', '2026-04-22T21:21:19.698Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69ea-8a6a-1b83-c92d3204481f', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":535.5}'::jsonb, '{"balance":10535.5}'::jsonb, '127.0.0.1', '2026-04-23T21:08:58.975Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69eb-cc0d-1b83-c92d32044d7c', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":156.5}'::jsonb, '{"balance":10156.5}'::jsonb, '127.0.0.1', '2026-04-24T20:01:17.602Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69eb-e8dd-1b83-c92d32044f17', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69e8a0cc1b83c92d32043ebe', '{"balance":15}'::jsonb, '{"balance":515}'::jsonb, '127.0.0.1', '2026-04-24T22:04:13.710Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69ec-8d05-1b83-c92d32045036', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69e8a0cc1b83c92d32043ebe', '{"balance":65}'::jsonb, '{"balance":565}'::jsonb, '127.0.0.1', '2026-04-25T09:44:37.528Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69ed-08d3-1b83-c92d32045348', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":155.5}'::jsonb, '{"balance":10155.5}'::jsonb, '127.0.0.1', '2026-04-25T18:32:51.546Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69ed-f9af-1b83-c92d3204583f', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":172.5}'::jsonb, '{"balance":10172.5}'::jsonb, '127.0.0.1', '2026-04-26T11:40:31.691Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69ef-3bc8-1b83-c92d32045fc4', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":126}'::jsonb, '{"balance":10126}'::jsonb, '127.0.0.1', '2026-04-27T10:34:48.060Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69f0-8c50-1b83-c92d32046701', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":78}'::jsonb, '{"balance":10078}'::jsonb, '127.0.0.1', '2026-04-28T10:30:40.554Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69f1-32c5-1b83-c92d32046bea', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":1111}'::jsonb, '{"balance":11111}'::jsonb, '127.0.0.1', '2026-04-28T22:20:53.145Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69f1-fbff-1b83-c92d32046de4', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '6953d3b2de74fefd3f969451', '{"balance":263.4}'::jsonb, '{"balance":2263.4}'::jsonb, '127.0.0.1', '2026-04-29T12:39:27.610Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69f2-6a73-1b83-c92d320470e3', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":191}'::jsonb, '{"balance":10191}'::jsonb, '127.0.0.1', '2026-04-29T20:30:43.614Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69f3-5c6d-1b83-c92d32047501', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69aabd4417bcf54fb116bf1a', '{"balance":150}'::jsonb, '{"balance":550}'::jsonb, '127.0.0.1', '2026-04-30T13:43:09.282Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69f3-7355-1b83-c92d320475a2', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":561.5}'::jsonb, '{"balance":10561.5}'::jsonb, '127.0.0.1', '2026-04-30T15:20:53.829Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69f3-cfe0-1b83-c92d32047874', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":341.5}'::jsonb, '{"balance":5341.5}'::jsonb, '127.0.0.1', '2026-04-30T21:55:44.608Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69f5-09ac-1b83-c92d32047d52', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69aabd4417bcf54fb116bf1a', '{"balance":100}'::jsonb, '{"balance":600}'::jsonb, '127.0.0.1', '2026-05-01T20:14:36.161Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69f5-09c7-1b83-c92d32047d60', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":41.5}'::jsonb, '{"balance":10041.5}'::jsonb, '127.0.0.1', '2026-05-01T20:15:03.498Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69f5-b265-1b83-c92d320480f2', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":36.5}'::jsonb, '{"balance":5036.5}'::jsonb, '127.0.0.1', '2026-05-02T08:14:29.999Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69f6-447c-1b83-c92d32048542', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":17.5}'::jsonb, '{"balance":5017.5}'::jsonb, '127.0.0.1', '2026-05-02T18:37:48.858Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69f6-6101-1b83-c92d320485f6', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69aabd4417bcf54fb116bf1a', '{"balance":150}'::jsonb, '{"balance":550}'::jsonb, '127.0.0.1', '2026-05-02T20:39:29.461Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69f7-1b63-1b83-c92d32048a8f', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":397.5}'::jsonb, '{"balance":5397.5}'::jsonb, '127.0.0.1', '2026-05-03T09:54:43.835Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69f7-b1ab-1b83-c92d32048d5f', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":327.5}'::jsonb, '{"balance":5327.5}'::jsonb, '127.0.0.1', '2026-05-03T20:35:55.510Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69f8-bbec-1b83-c92d320490ff', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":92.5}'::jsonb, '{"balance":10092.5}'::jsonb, '127.0.0.1', '2026-05-04T15:31:56.272Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69f9-9905-1b83-c92d32049502', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69443e1beeea3fc22a3b7424', '{"balance":0}'::jsonb, '{"balance":500}'::jsonb, '127.0.0.1', '2026-05-05T07:15:17.723Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69fa-11ae-1b83-c92d32049921', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '6999e32719f20ddc42ab268b', '{"balance":453.5999999999999}'::jsonb, '{"balance":908.9999999999999}'::jsonb, '127.0.0.1', '2026-05-05T15:50:06.219Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69fa-260a-1b83-c92d320499b9', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69efe0ee1b83c92d32046494', '{"balance":174}'::jsonb, '{"balance":3174}'::jsonb, '127.0.0.1', '2026-05-05T17:16:58.129Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69fb-1f98-1b83-c92d32049ea2', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69efe0ee1b83c92d32046494', '{"balance":15}'::jsonb, '{"balance":1015}'::jsonb, '127.0.0.1', '2026-05-06T11:01:44.383Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69fb-a78f-1b83-c92d3204a17f', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69efe0ee1b83c92d32046494', '{"balance":280}'::jsonb, '{"balance":1280}'::jsonb, '127.0.0.1', '2026-05-06T20:41:51.570Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69fc-9433-1b83-c92d3204a50f', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":71.59999999999991}'::jsonb, '{"balance":5071.6}'::jsonb, '127.0.0.1', '2026-05-07T13:31:31.993Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69fd-b8de-1b83-c92d3204a8ba', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":531.6000000000004}'::jsonb, '{"balance":10531.6}'::jsonb, '127.0.0.1', '2026-05-08T10:20:14.709Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69fe-b8c5-1b83-c92d3204ae32', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'api_key_generated', 'User', '691c8e9c0905272b76d063c7', NULL, '{"api_key_enabled":true}'::jsonb, '127.0.0.1', '2026-05-09T04:32:05.997Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69fe-b8c7-1b83-c92d3204ae36', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'api_key_generated', 'User', '691c8e9c0905272b76d063c7', NULL, '{"api_key_enabled":true}'::jsonb, '127.0.0.1', '2026-05-09T04:32:07.244Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-69ff-4602-1b83-c92d3204b1b9', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":43.600000000000364}'::jsonb, '{"balance":10043.6}'::jsonb, '127.0.0.1', '2026-05-09T14:34:42.174Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a00-dc98-1b83-c92d3204bae9', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":448.60000000000036}'::jsonb, '{"balance":10448.6}'::jsonb, '127.0.0.1', '2026-05-10T19:29:28.871Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a02-19a1-1b83-c92d3204c35d', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":48.600000000000364}'::jsonb, '{"balance":10048.6}'::jsonb, '127.0.0.1', '2026-05-11T18:02:09.847Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a03-5443-1b83-c92d3204c8ee', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":423.60000000000036}'::jsonb, '{"balance":10423.6}'::jsonb, '127.0.0.1', '2026-05-12T16:24:35.586Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a04-d529-1b83-c92d3204d364', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":748.6000000000004}'::jsonb, '{"balance":10748.6}'::jsonb, '127.0.0.1', '2026-05-13T19:46:49.835Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a07-1c62-1b83-c92d3204dd2f', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":338.60000000000036}'::jsonb, '{"balance":10338.6}'::jsonb, '127.0.0.1', '2026-05-15T13:15:14.397Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a08-1d30-1b83-c92d3204e1d5', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":303.60000000000036}'::jsonb, '{"balance":10303.6}'::jsonb, '127.0.0.1', '2026-05-16T07:30:56.693Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a09-ca96-1b83-c92d3204eacb', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":233.60000000000036}'::jsonb, '{"balance":10233.6}'::jsonb, '127.0.0.1', '2026-05-17T14:03:02.938Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a0a-f1b8-1b83-c92d3204f285', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '6a0af1151b83c92d3204f243', '{"balance":0}'::jsonb, '{"balance":200}'::jsonb, '127.0.0.1', '2026-05-18T11:02:16.461Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a0b-6ef1-1b83-c92d3204f4f1', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":13.600000000000364}'::jsonb, '{"balance":10013.6}'::jsonb, '127.0.0.1', '2026-05-18T19:56:33.784Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a0c-7721-1b83-c92d3204fab1', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":308.60000000000036}'::jsonb, '{"balance":10308.6}'::jsonb, '127.0.0.1', '2026-05-19T14:43:45.196Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a0c-8c56-1b83-c92d3204fc31', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '6a0c891e1b83c92d3204fbd7', '{"balance":1980}'::jsonb, '{"balance":2980}'::jsonb, '127.0.0.1', '2026-05-19T16:14:14.882Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a0d-e7e9-1b83-c92d320503ff', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":388.60000000000036}'::jsonb, '{"balance":10388.6}'::jsonb, '127.0.0.1', '2026-05-20T16:57:13.034Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a0f-0567-1b83-c92d3205098a', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":133.60000000000036}'::jsonb, '{"balance":10133.6}'::jsonb, '127.0.0.1', '2026-05-21T13:15:19.535Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a10-ad85-1b83-c92d32050f44', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":63.600000000000364}'::jsonb, '{"balance":10063.6}'::jsonb, '127.0.0.1', '2026-05-22T19:24:53.640Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a12-1156-1b83-c92d32051539', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":40.600000000000364}'::jsonb, '{"balance":10040.6}'::jsonb, '127.0.0.1', '2026-05-23T20:43:02.892Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a14-65ed-1b83-c92d32051d27', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":185.60000000000036}'::jsonb, '{"balance":10185.6}'::jsonb, '127.0.0.1', '2026-05-25T15:08:29.429Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a15-e142-48ca-75899e17d107', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":380.60000000000036}'::jsonb, '{"balance":10380.6}'::jsonb, '127.0.0.1', '2026-05-26T18:06:58.574Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a17-453f-48ca-75899e17d920', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":490.60000000000036}'::jsonb, '{"balance":10490.6}'::jsonb, '127.0.0.1', '2026-05-27T19:25:51.272Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a17-5df0-48ca-75899e17dca5', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '6a0c891e1b83c92d3204fbd7', '{"balance":562.3000000000002}'::jsonb, '{"balance":1262.3000000000002}'::jsonb, '127.0.0.1', '2026-05-27T21:11:12.409Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a18-b6a7-48ca-75899e17e2e3', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":35.600000000000364}'::jsonb, '{"balance":10035.6}'::jsonb, '127.0.0.1', '2026-05-28T21:41:59.603Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a19-f785-48ca-75899e17e7fd', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '6a16a58b48ca75899e17d54f', '{"balance":90}'::jsonb, '{"balance":790}'::jsonb, '127.0.0.1', '2026-05-29T20:31:01.415Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a1b-2b2d-48ca-75899e17edd2', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":15.600000000000364}'::jsonb, '{"balance":10015.6}'::jsonb, '127.0.0.1', '2026-05-30T18:23:41.043Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a1d-de72-48ca-75899e17fb72', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":260.60000000000036}'::jsonb, '{"balance":10260.6}'::jsonb, '127.0.0.1', '2026-06-01T19:33:06.056Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a1f-30bf-48ca-75899e1800f7', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '6a0c891e1b83c92d3204fbd7', '{"balance":248.30000000000018}'::jsonb, '{"balance":1248.3000000000002}'::jsonb, '127.0.0.1', '2026-06-02T19:36:31.247Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a20-7626-48ca-75899e1804b7', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":385.60000000000036}'::jsonb, '{"balance":10385.6}'::jsonb, '127.0.0.1', '2026-06-03T18:44:54.996Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a23-247c-48ca-75899e180d1b', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":135.60000000000036}'::jsonb, '{"balance":10135.6}'::jsonb, '127.0.0.1', '2026-06-05T19:33:16.879Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a24-2155-48ca-75899e18105e', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'api_key_generated', 'User', '69eaa6e51b83c92d32044906', NULL, '{"api_key_enabled":true}'::jsonb, '127.0.0.1', '2026-06-06T13:32:05.272Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a24-899d-48ca-75899e181383', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":280.60000000000036}'::jsonb, '{"balance":10280.6}'::jsonb, '127.0.0.1', '2026-06-06T20:57:01.952Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a24-8d1f-48ca-75899e1813c8', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '6a0c891e1b83c92d3204fbd7', '{"balance":318.3000000000002}'::jsonb, '{"balance":2318.3}'::jsonb, '127.0.0.1', '2026-06-06T21:11:59.620Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a26-dc07-48ca-75899e181a17', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '6983b4bce7515e1550be465d', '{"balance":311}'::jsonb, '{"balance":2311}'::jsonb, '127.0.0.1', '2026-06-08T15:13:11.399Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a27-1b0f-48ca-75899e181c21', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69efe0ee1b83c92d32046494', '{"balance":48.200000000000045}'::jsonb, '{"balance":548.2}'::jsonb, '127.0.0.1', '2026-06-08T19:42:07.926Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a27-3881-48ca-75899e181d3c', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":620.6000000000004}'::jsonb, '{"balance":10620.6}'::jsonb, '127.0.0.1', '2026-06-08T21:47:45.986Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a2a-7a3c-48ca-75899e182667', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":1175.6000000000004}'::jsonb, '{"balance":11175.6}'::jsonb, '127.0.0.1', '2026-06-11T09:05:00.136Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a2e-c42c-48ca-75899e183477', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '6a0c891e1b83c92d3204fbd7', '{"balance":598.3000000000002}'::jsonb, '{"balance":3598.3}'::jsonb, '127.0.0.1', '2026-06-14T15:09:32.337Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a2e-c44b-48ca-75899e18348f', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":445.60000000000036}'::jsonb, '{"balance":5445.6}'::jsonb, '127.0.0.1', '2026-06-14T15:10:03.327Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a30-2a9c-48ca-75899e183821', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":375.60000000000036}'::jsonb, '{"balance":10375.6}'::jsonb, '127.0.0.1', '2026-06-15T16:38:52.996Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a31-a3dc-48ca-75899e183bb8', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '6a0585df1b83c92d3204d715', '{"balance":56}'::jsonb, '{"balance":551}'::jsonb, '127.0.0.1', '2026-06-16T19:28:28.221Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a32-f765-48ca-75899e1840c1', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":115.60000000000036}'::jsonb, '{"balance":10115.6}'::jsonb, '127.0.0.1', '2026-06-17T19:37:09.753Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a33-7486-48ca-75899e1841e6', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '6a3278b248ca75899e183ed6', '{"balance":0}'::jsonb, '{"balance":500}'::jsonb, '127.0.0.1', '2026-06-18T04:31:02.156Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a33-74c2-48ca-75899e184206', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '6a2fb43b48ca75899e183745', '{"balance":0}'::jsonb, '{"balance":500}'::jsonb, '127.0.0.1', '2026-06-18T04:32:02.535Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a35-1cec-48ca-75899e18461b', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69fb1a8b1b83c92d32049e2f', '{"balance":105.14999999999998}'::jsonb, '{"balance":1105.15}'::jsonb, '127.0.0.1', '2026-06-19T10:41:48.375Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a35-5e15-14ff-47214c2014a4', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '6a3278b248ca75899e183ed6', '{"balance":150}'::jsonb, '{"balance":645}'::jsonb, '127.0.0.1', '2026-06-19T15:19:49.235Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a35-7e88-14ff-47214c201694', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '69e4df9b73c6958a017d16ea', '{"balance":4.5}'::jsonb, '{"balance":464.5}'::jsonb, '127.0.0.1', '2026-06-19T17:38:16.264Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a35-7eba-14ff-47214c2016aa', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '6935d3eceeea3fc22a3b5b48', '{"balance":60.30000000000007}'::jsonb, '{"balance":1560.3000000000002}'::jsonb, '127.0.0.1', '2026-06-19T17:39:06.537Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a37-21cd-14ff-47214c201b95', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '6926cf4223d5b6aac2873805', '{"balance":0}'::jsonb, '{"balance":495}'::jsonb, '127.0.0.1', '2026-06-20T23:27:09.139Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a37-9d9a-14ff-47214c201d9d', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":140.60000000000036}'::jsonb, '{"balance":10140.6}'::jsonb, '127.0.0.1', '2026-06-21T08:15:22.833Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a3a-1e29-14ff-47214c2025f1', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":94.60000000000036}'::jsonb, '{"balance":10094.6}'::jsonb, '127.0.0.1', '2026-06-23T05:48:25.963Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a3c-1d4b-14ff-47214c202aa2', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '6a0c891e1b83c92d3204fbd7', '{"balance":1376.8000000000002}'::jsonb, '{"balance":2876.8}'::jsonb, '127.0.0.1', '2026-06-24T18:09:15.104Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a3c-35d8-14ff-47214c202ba6', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":204.60000000000036}'::jsonb, '{"balance":10204.6}'::jsonb, '127.0.0.1', '2026-06-24T19:54:00.706Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a3d-835c-14ff-47214c202e2b', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '6a16a58b48ca75899e17d54f', '{"balance":49}'::jsonb, '{"balance":5049}'::jsonb, '127.0.0.1', '2026-06-25T19:37:00.898Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a41-624a-14ff-47214c203620', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":104.60000000000036}'::jsonb, '{"balance":10104.6}'::jsonb, '127.0.0.1', '2026-06-28T18:04:58.928Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a42-c7e6-14ff-47214c203aee', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":269.60000000000036}'::jsonb, '{"balance":10269.6}'::jsonb, '127.0.0.1', '2026-06-29T19:30:46.137Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a47-c318-14ff-47214c204511', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":129.60000000000036}'::jsonb, '{"balance":5129.6}'::jsonb, '127.0.0.1', '2026-07-03T14:11:36.231Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a48-d9e9-14ff-47214c2047af', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":79.60000000000036}'::jsonb, '{"balance":5079.6}'::jsonb, '127.0.0.1', '2026-07-04T10:01:13.412Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a4d-3578-14ff-47214c204f56', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":379.60000000000036}'::jsonb, '{"balance":10379.6}'::jsonb, '127.0.0.1', '2026-07-07T17:20:56.431Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a50-0ebb-14ff-47214c2057ea', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'api_key_generated', 'User', '695a6b8f8b59d9ec21030254', NULL, '{"api_key_enabled":true}'::jsonb, '127.0.0.1', '2026-07-09T21:12:27.581Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a50-cc38-14ff-47214c20594a', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":9.600000000000364}'::jsonb, '{"balance":10009.6}'::jsonb, '127.0.0.1', '2026-07-10T10:40:56.073Z')
ON CONFLICT (id) DO NOTHING;
INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES ('00000000-6a52-b697-14ff-47214c205e48', '00000000-6913-80a2-e3ba-eb2c24cb7bbf', NULL, 'wallet_credited', 'Wallet', '691c8e9c0905272b76d063c9', '{"balance":124.60000000000036}'::jsonb, '{"balance":5124.6}'::jsonb, '127.0.0.1', '2026-07-11T21:33:11.460Z')
ON CONFLICT (id) DO NOTHING;

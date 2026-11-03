-- Repair clinic registrations made after the original Better Auth migration.
INSERT INTO `BaAccount` (`id`, `accountId`, `providerId`, `userId`, `password`, `createdAt`, `updatedAt`)
SELECT CONCAT('bacred_', u.`id`), u.`id`, 'credential', u.`id`, u.`password`, NOW(3), NOW(3)
FROM `User` u
WHERE u.`password` <> '' AND NOT EXISTS (
  SELECT 1 FROM `BaAccount` a WHERE a.`userId` = u.`id` AND a.`providerId` = 'credential'
);

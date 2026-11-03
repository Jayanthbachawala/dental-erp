-- Better Auth stores credentials in BaAccount. Keep the legacy field for
-- existing application writes while allowing auth-managed user inserts.
ALTER TABLE `User` MODIFY `password` VARCHAR(191) NOT NULL DEFAULT '';

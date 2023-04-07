/*
  Warnings:

  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "User";

-- CreateTable
CREATE TABLE "users" (
    "id" SERIAL NOT NULL,
    "first_name" TEXT NOT NULL,
    "second_name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "mobile" VARCHAR(20) NOT NULL,
    "password" TEXT NOT NULL,
    "picture_url" TEXT NOT NULL,
    "created_at" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "institutions" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "acronym" VARCHAR(15) NOT NULL,

    CONSTRAINT "institutions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "labs" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(20) NOT NULL,
    "institution_id" INTEGER NOT NULL,
    "short_name" VARCHAR(8) NOT NULL,

    CONSTRAINT "labs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "users_labs" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "lab_id" INTEGER NOT NULL,

    CONSTRAINT "users_labs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "equipments" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(40) NOT NULL,
    "status" VARCHAR(20) DEFAULT 'available',

    CONSTRAINT "equipments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "labs_equipments" (
    "id" SERIAL NOT NULL,
    "lab_id" INTEGER NOT NULL,
    "equipment_id" INTEGER NOT NULL,

    CONSTRAINT "labs_equipments_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "unique_user_lab" ON "users_labs"("user_id", "lab_id");

-- AddForeignKey
ALTER TABLE "labs" ADD CONSTRAINT "fk_inst_id" FOREIGN KEY ("institution_id") REFERENCES "institutions"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "users_labs" ADD CONSTRAINT "fk_lab_id" FOREIGN KEY ("lab_id") REFERENCES "labs"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "users_labs" ADD CONSTRAINT "fk_user_id" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "labs_equipments" ADD CONSTRAINT "fk_eq_id" FOREIGN KEY ("equipment_id") REFERENCES "equipments"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "labs_equipments" ADD CONSTRAINT "fk_lab_id" FOREIGN KEY ("lab_id") REFERENCES "labs"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

import { PrismaClient, equipments, institutions } from "@prisma/client";

const prisma = new PrismaClient();

async function main() {
  let institutions: institutions | null = await prisma.institutions.findFirst();
  let equipments: equipments | null = await prisma.equipments.findFirst();
  if (!institutions) {
    const data = [
      { name: "Universidade Federal do Rio Grande do Norte", acronym: "UFRN" },
      { name: "Instituto Federal do Rio Grande do Norte", acronym: "IFRN" },
    ];
    await prisma.institutions.createMany({ data });
    console.log("Institutions seeded!");
  }
  if (!equipments) {
    const data = [
      { name: "Infrared Spectometer - Shimadzu" },
      { name: "Oven 100L - 200˚C" },
      { name: "Oven 300L - 200˚C" },
    ];
    await prisma.equipments.createMany({ data });
    console.log("Equipments seeded!");
  }
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });

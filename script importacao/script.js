const admin = require('firebase-admin');
const fs = require('fs');
const csv = require('fast-csv');

const serviceAccount = require('./firebase_service.json');

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount)
});

const db = admin.firestore();

const docRef = db.collection('teste').doc();
main();

async function main() {
    fs.createReadStream('./Planilha da casa.xlsx - Utensílios.csv')
        .pipe(csv.parse({ headers: true }))
        .on('error', error => console.error(error))
        .on('data', async row => {
            const docRef = db.collection('teste').doc();
            await docRef.set({
                comodo: row['comodo'],
                nome: row['nome'],
                link: row['link'],
                reservado: false,
            })
        })
        .on('end', rowCount => console.log(`Parsed ${rowCount} rows`));

}

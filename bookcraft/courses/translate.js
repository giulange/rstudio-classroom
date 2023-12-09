const fs = require('fs');
const { execSync } = require('child_process');
const translate = require('@vitalets/google-translate-api');  // Dipendenza per traduzione

// Percorso dei file Rmd
const enPath = 'book/en/index.Rmd';
const itPath = 'book/it/index.Rmd';

// Leggi il contenuto del file inglese
const enContent = fs.readFileSync(enPath, 'utf-8');

// Traduzione dinamica utilizzando Google Translate API
translate(enContent, { to: 'it' }).then((result) => {
  // Scrivi la traduzione italiana nel file italiano
  fs.writeFileSync(itPath, result.text);

  // Esegui il commit e il push in Git
  execSync('git add . && git commit -m "Aggiornamento traduzione italiana" && git push', {
    cwd: 'path/to/your/repo'
  });
}).catch((error) => {
  console.error('Errore durante la traduzione:', error);
});


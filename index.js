const mineflayer = require('mineflayer');
const express = require('express');
const app = express();

// 1. KODE WEB SERVER (Untuk syarat Render & Anti-Sleep)
app.get('/', (req, res) => res.send('Bot Minecraft Sedang Berjalan!'));
const port = process.env.PORT || 3000;
app.listen(port, () => console.log(`Web server hidup di port ${port}`));

// 2. KODE BOT MINECRAFT
function createBot() {
    const bot = mineflayer.createBot({
        host: 'alwination.id',
        username: 'Han_CraftAlt',
        version: '1.13.2' // <-- Ini sudah diganti ke 1.13.2
    });

    bot.on('spawn', async () => {
        console.log('Bot berhasil masuk ke server!');
        
        // Fungsi untuk membuat jeda (delay)
        const delay = ms => new Promise(resolve => setTimeout(resolve, ms));

        // Command 1: Login 3 kali dengan delay 1 detik
        for (let i = 0; i < 3; i++) {
            bot.chat('/login 082385');
            await delay(1000);
        }
        console.log('Selesai command login');

        // Command 2: Pindah server ke OneBlock2 sebanyak 3 kali dengan delay 1 detik
        for (let i = 0; i < 3; i++) {
            bot.chat('/server OneBlock2');
            await delay(1000);
        }
        console.log('Selesai command pindah server');

        // Command 3: Masukkan password ShopOre 1 kali
        bot.chat('/pw ShopOre');
        console.log('Selesai command pw. Bot sekarang AFK & Stay Online!');
    });

    // Menampilkan error jika ada
    bot.on('error', err => console.log('Error:', err));

    // Fitur Auto-Reconnect jika bot ditendang/terputus dari server
    bot.on('end', () => {
        console.log('Bot terputus! Menyambungkan kembali dalam 5 detik...');
        setTimeout(createBot, 5000);
    });
}

// Menjalankan bot
createBot();

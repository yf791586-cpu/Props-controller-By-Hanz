const mineflayer = require('mineflayer');
const http = require('http');

// Web server kecil agar panel Wispbyte tidak tidur
http.createServer((req, res) => {
    res.writeHead(200);
    res.end('OK');
}).listen(8080);

function createBot() {
    const bot = mineflayer.createBot({
        host: 'alwination.id',
        username: 'Han_CraftAlt',
        version: '1.13.2',
        physicsEnabled: false, // Mematikan kalkulasi fisika (Hemat CPU drastis)
        viewDistance: 'tiny',  // Render jarak dekat (Hemat RAM & CPU)
        checkTimeoutInterval: 60000
    });

    const delay = ms => new Promise(resolve => setTimeout(resolve, ms));

    bot.once('spawn', async () => {
        console.log('Bot berhasil masuk ke server!');
        
        for (let i = 0; i < 2; i++) {
            bot.chat('/login 082385');
            await delay(1500);
        }
        
        for (let i = 0; i < 2; i++) {
            bot.chat('/server OneBlock2');
            await delay(1500);
        }
        
        bot.chat('/pw ShopOre');
        console.log('Bot AFK aktif (Mode Ultra Ringan - Tanpa Console).');

        // Anti-AFK pukul angin setiap 5 menit (sangat ringan untuk CPU)
        setInterval(() => {
            try {
                bot.swingArm('right');
            } catch(e) {}
        }, 5 * 60 * 1000);
    });

    bot.on('error', (err) => {});
    
    bot.on('kicked', (reason) => console.log('Di-kick server:', reason));

    bot.on('end', () => {
        console.log('Bot terputus! Reconnecting dalam 5 detik...');
        setTimeout(createBot, 5000);
    });
}

// Pelindung agar program tidak crash
process.on('uncaughtException', () => {});
process.on('unhandledRejection', () => {});

createBot();



const nodemailer = require('nodemailer');
const { google } = require('googleapis');
const fs = require('fs');


const file = 'ver.json';
const data = fs.readFileSync(file, 'utf8');
const { myVariable1, myVariable2 } = JSON.parse(data);
const CLIENT_ID = '161063599506-nip09hk8ctj7eil62hp9nbjv9une6l4t.apps.googleusercontent.com';
const CLEINT_SECRET = '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';
const REDIRECT_URI = 'https://developers.google.com/oauthplayground';
const REFRESH_TOKEN = '1//04o2CWHXRw004CgYIARAAGAQSNwF-L9IrQWLS0QZNjAYHUyIaEKF8EOb8wGlUW8SCpRpBLc46HIJuaS09bNFqxJIoEEAiiPZgXuM';
const oAuth2Client = new google.auth.OAuth2(
  CLIENT_ID,
  CLEINT_SECRET,
  REDIRECT_URI
);
oAuth2Client.setCredentials({ refresh_token: REFRESH_TOKEN });

async function sendMail() {
  try {
    const accessToken = await oAuth2Client.getAccessToken();

    const transport = nodemailer.createTransport({
      service: 'gmail',
      auth: {
        type: 'OAuth2',
        user: 'nramgopal01@gmail.com',
        clientId: CLIENT_ID,
        clientSecret: CLEINT_SECRET,
        refreshToken: REFRESH_TOKEN,
        accessToken: accessToken,
      },
    });

    const mailOptions = {
      from: 'EMS <nramgopal01@gmail.com>',
      to: myVariable1,
      subject: 'OTP From EMS',
      text: 'Your OTP is '+ myVariable2,
      html: '<h1>OTP for password recovery</h1><p>Your OTP is:'+ myVariable2 + '</p>',
    };

    const result = await transport.sendMail(mailOptions);
    return result;
  } catch (error) {
    return error;
  }
}
sendMail()
  .then((result) => console.log('Email sent...', result))
  .catch((error) => console.log(error.message));



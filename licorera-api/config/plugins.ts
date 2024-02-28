// export default () => ({});


module.exports = ({ env }) => ({
    // ...
    upload: {
      config: {
        provider: 'aws-s3',
        providerOptions: {
          accessKeyId: env('AWS_ACCESS_KEY_ID'),
          secretAccessKey: env('AWS_ACCESS_SECRET'),
          region: env('AWS_REGION'),
          params: {
            ACL: 'private', // <== set ACL to private
            Bucket: env('AWS_BUCKET'),
          },
        },
        actionOptions: {
          upload: {},
          uploadStream: {},
          delete: {},
        },
      },
    },

    // ...
    // email: {
    //   provider: 'nodemailer',
    //   providerOptions: {
    //     host: env('SMTP_HOST'),
    //     port: env.int('SMTP_PORT'), // Convertimos el puerto a un entero
    //     secure: false, // Normalmente, Outlook utiliza TLS en el puerto 587
    //     auth: {
    //       user: env('SMTP_USERNAME'),
    //       pass: env('SMTP_PASSWORD')
    //     },
    //   },
    //   settings: {
    //     defaultFrom: env('DEFAULT_FROM'),
    //     defaultReplyTo: env('DEFAULT_FROM'), // O puedes establecer otra dirección de respuesta
    //   },
    // }
  });
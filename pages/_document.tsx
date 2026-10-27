import { Html, Head, Main, NextScript } from 'next/document';

export default function Document() {
  return (
    <Html lang="en">
      <Head>
        <meta charSet="UTF-8" />
        <link rel="icon" type="image/png" href="/marabus-logo.png" />
        <link rel="shortcut icon" href="/marabus-logo.png" />
        <link rel="apple-touch-icon" href="/marabus-logo.png" />
        <meta name="description" content="Marabusdata VTU & Bill Payments Admin Management Portal" />
        <meta name="theme-color" content="#1e3a8a" />
        <meta property="og:title" content="Marabusdata Admin Panel" />
        <meta property="og:description" content="Marabusdata VTU & Bill Payments Admin Management Portal" />
        <meta property="og:image" content="/marabus-logo.png" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossOrigin="anonymous" />
        <link
          href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
          rel="stylesheet"
        />
      </Head>
      <body className="bg-slate-50 text-slate-800 antialiased">
        <Main />
        <NextScript />
      </body>
    </Html>
  );
}

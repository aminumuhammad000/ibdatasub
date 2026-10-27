import Head from 'next/head';

export default function Home() {
  return (
    <>
      <Head>
        <title>Murabus Data | Airtime, Data & Bill Payments</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      </Head>
      <iframe
        src="/landing.html"
        title="Murabus Data Landing Page"
        className="w-full h-screen border-none m-0 p-0 overflow-auto"
        style={{ width: '100vw', height: '100vh', border: 'none', display: 'block' }}
      />
    </>
  );
}

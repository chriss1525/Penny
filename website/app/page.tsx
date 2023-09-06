import Link from "next/link";

export default function Home() {
  return (
    <main>
      <Nav />
      <Hero />
    </main>
  );
}

function Nav() {
  return (
    <nav className="sticky top-0 shadow-lg flex flex-row w-full items-center justify-center">
      <ul className="w-full max-w-4xl h-16 flex flex-row gap-8 items-center">
        <NavLink href="/" text="Penny" />
        <div className="w-full"></div>
        <NavLink href="#about" text="About" />
        <NavLink href="#features" text="Features" />
        <NavLink href="#demo" text="Demo" />
      </ul>
    </nav>
  );
}

function NavLink({ href, text }: { href: string; text: string }) {
  return (
    <li className="">
      <Link href={href}>
        <p>{text}</p>
      </Link>
    </li>
  );
}

function Hero() {
  return (
    <section className="h-72 bg-cover bg-no-repeat bg-bottom" style={{height: 'calc(100vh - 64px)', backgroundImage: 'url(/hero.jpg)'}}>
      <div></div>
    </section>
  );
}

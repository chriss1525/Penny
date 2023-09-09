<template>
	<section id="about" class="flex justify-center w-full pt-16 text-slate-900">
		<div
			class="w-full max-w-4xl flex flex-col items-center text-center gap-8"
		>
			<header class="section-header">
				<h2 class="text-xl">About Us</h2>
			</header>
			<div class="flex flex-col gap-16 items-center">
				<div class="flex flex-col gap-4 max-w-xl">
					<h3 class="text-4xl font-semibold">Inspiration</h3>
					<p>
						We made Penny to help you answer the question, "Where
						did my money go?"
					</p>
					<p>
						By automatically tracking your money, Penny helps you
						understand your financial habits and help you achieve
						your goals.
					</p>
				</div>
				<div class="flex flex-col gap-4 max-w-xl">
					<h3 class="text-4xl font-semibold">Connect with us</h3>
					<div class="flex flex-row gap-4 md:gap-16 p-4">
						<AboutCard
							name="Akuya Ekorot"
							img="/akuya.jpg"
							title="Software Engineer"
							:socials="{
								githubUrl: 'https://github.com/akuya-ekorot',
								linkedinUrl:
									'https://linkedin.com/in/akuya-ekorot',
								twitterUrl: 'https://twitter.com/akuya_ekorot',
							}"
						/>
						<AboutCard
							name="Christine Okoth"
							img="/chriss.jpeg"
							title="Software Engineer"
							:socials="{
								githubUrl: 'https://github.com/chriss1525',
								linkedinUrl:
									'https://linkedin.com/in/christine-okoth-6a7789214',
								twitterUrl: 'https://twitter.com/DiahChrissy',
							}"
						/>
					</div>
				</div>
				<div class="flex flex-col gap-8 items-center pb-8">
					<div>
						<a
							class="flex flex-row items-center gap-4"
							target="blank"
							href="https://github.com/chriss1525/Penny"
						>
							<img
								class="w-8 h-8"
								src="/github-mark.svg"
								alt="Penny's github repository"
							/>
							<p>View source code</p>
						</a>
					</div>
				</div>
			</div>
		</div>
	</section>
</template>

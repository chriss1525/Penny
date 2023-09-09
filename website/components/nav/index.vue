<template>
	<div class="flex flex-col items-center shadow sticky top-0 bg-fuchsia-600 text-fuchsia-100">
		<nav class="flex flex-row justify-between items-center w-full max-w-4xl h-16 px-8">
			<div>
				<a href="/">
					<p class="font-semibold md:text-xl text-lg">Penny</p>
				</a>
			</div>
			<ul class="flex flex-row md:gap-8 gap-4 items-center text-sm md:text-base">
				<li v-for="(link, index) in links" :key="index">
					<a :href="link.href">
						<p class="">{{ link.text }}</p>
					</a>
				</li>
			</ul>
		</nav>
	</div>
</template>

<script lang="ts" setup>
export interface Link {
	href: string
	text: string
}

const links: Link[] = [
	{ href: '/#about', text: 'About' },
	{ href: '/#features', text: 'Features' },
	{ href: '/#demo', text: 'Demo' },
]
</script>

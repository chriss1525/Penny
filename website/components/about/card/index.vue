<template>
	<div
		class="flex flex-col items-center gap-4 border shadow-lg rounded md:p-8 p-4"
	>
		<img class="w-24 rounded-full" :src="img" :alt="`${name}: ${title}`" />
		<div class="">
			<h4 class="font-semibold text-lg">{{ name }}</h4>
			<p class="text-slate-800">{{ title }}</p>
		</div>
		<div class="flex flex-row gap-4 items-center p-2 mt-2">
			<a target="blank" :href="socials.githubUrl">
				<img
					class="w-4 h-4"
					src="/github-mark.svg"
					:alt="`${name}'s github profile`"
				/>
			</a>
			<a target="blank" :href="socials.twitterUrl">
				<img
					class="h-4"
					src="/x-logo.png"
					:alt="`${name}'s twitter profile`"
				/>
			</a>
			<a target="blank" :href="socials.linkedinUrl">
				<img
					class="h-4"
					src="/linkedin-logo.png"
					:alt="`${name}'s linkedin profile`"
				/>
			</a>
		</div>
	</div>
</template>

<script lang="ts" setup>
interface TeamCardProps {
	name: string;
	title: string;
	img: string;
	socials: {
		githubUrl: string;
		twitterUrl: string;
		linkedinUrl: string;
	};
}

defineProps<TeamCardProps>();
</script>

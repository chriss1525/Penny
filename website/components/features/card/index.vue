<template>
  <div class="w-full flex flex-col gap-4 bg-fuchsia-100 border shadow-lg rounded overflow-hidden">
    <div class="feature w-full h-full flex flex-col gap-4">
      <div v-if="title === 'Automatic Records'" class="h-48">
        <img class="object-cover h-full w-full" :src="photo.src" :alt="photo.alt" />
      </div>
      <div v-else class="h-48 p-4 bg-white">
        <img class="object-contain h-full w-full" :src="photo.src" :alt="photo.alt" />
      </div>
      <div class="feature-copy flex flex-col gap-2 w-full p-4">
        <h3 class="text-xl font-semibold">{{ title }}</h3>
        <p>{{ description }}</p>
      </div>
    </div>
  </div>
</template>

<script lang="ts" setup>
interface FeaturesCardProps {
  title: string;
  description: string;
  photo: {
    src: string;
    alt: string;
  };
}

defineProps<FeaturesCardProps>();
</script>

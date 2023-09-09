<template>
  <div class="section-body w-full flex flex-col gap-4">
    <div class="feature w-full h-full flex flex-col gap-4 border shadow-lg rounded bg-white overflow-hidden">
      <div class="h-48 p-4">
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

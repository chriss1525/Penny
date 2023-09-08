<template>
  <div class="section-body w-full flex flex-col gap-4">
    <div class="feature w-full flex flex-row gap-16">
      <div class="feature-copy flex flex-col gap-2 w-full">
        <h3 class="text-2xl font-semibold">{{ title }}</h3>
        <p>{{ description }}</p>
      </div>
      <div class="feature-media w-full">
        <img :src="photo.src" :alt="photo.alt" />
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
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

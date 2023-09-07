<template>
  <div class="section-body w-full flex flex-col gap-4">
    <div class="feature w-full max-w-md flex flex-row h-80">
      <div class="feature-copy flex flex-col gap-2">
        <h3 class="text-2xl font-semibold">{{ title }}</h3>
        <p>{{ description }}</p>
      </div>
      <div class="feature-media"></div>
    </div>
  </div>
</template>

<script setup lang="ts">
interface FeaturesCardProps {
  title: string;
  description: string;
}

defineProps<FeaturesCardProps>();
</script>

<template>
  <section id="features" class="flex justify-center w-full">
    <div class="w-full max-w-4xl flex flex-col gap-12 p-4">
      <header class="section-header">
        <h2 class="text-xl">Features</h2>
      </header>
      <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
        <features-card v-for="(feature, index) in features" :key="index" :title="feature.title"
          :description="feature.description" :photo="feature.photo" />
      </div>
    </div>
  </section>
</template>

<script lang="ts" setup>
const features = [
  {
    title: "Automatic Records",
    description: "Penny automatically records your transactions. So you don't have to worry about forgetting to track your transactions.",
    photo: {
      src: "/records.jpg",
      alt: "Penny automatically records your transactions",
    },
  },
  {
    title: "Sync with MPESA",
    description: "Penny syncs with your most popular payment method, MPESA, seamlessly.",
    photo: {
      src: "/mpesa.jpg",
      alt: "Penny automatically records your transactions",
    },
  },
  {
    title: "Timely Insights",
    description: "Penny sends you timely insights about your money habits to empower you to achieve your financial goals.",
    photo: {
      src: "/pie.jpg",
      alt: "Penny automatically records your transactions",
    },
  }
]
</script>

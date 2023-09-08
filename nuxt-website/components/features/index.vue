<template>
  <section id="features" class="flex justify-center w-full pt-16">
    <div class="w-full max-w-4xl flex flex-col gap-8">
      <header class="section-header">
        <h2 class="text-xl">Features</h2>
      </header>
      <div class="flex flex-col gap-24">
        <features-card title="Automatic Records"
          description="Penny automatically records your transactions. So you don't have to worry about forgetting to track your transactions."
          :photo="{ src: '/records.jpg', alt: 'Penny automatically records your transactions' }" />
        <features-card title="Sync with MPESA"
          description="Penny syncs with your most popular payment method, MPESA, seamlessly."
          :photo="{ src: '/records.jpg', alt: 'Penny automatically records your transactions' }" />
        <features-card title="Timely Insights"
          description="Penny sends you timely insights about your money habits to empower you to achieve your financial goals."
          :photo="{ src: '/records.jpg', alt: 'Penny automatically records your transactions' }" />
      </div>
    </div>
  </section>
</template>

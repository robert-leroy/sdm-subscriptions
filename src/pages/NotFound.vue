<template>
  <div class="about">
    <h1>Page Not Found</h1>
    <div class="about-content">
      <div class="info-section">
        <h2>System Overview</h2>
        <p>It seems we've lost our way.</p>
      </div>

      <div class="info-section">
        <h2>Support</h2>
        <p>
          For technical support or questions about the SDM Subscriptions system,
          please contact your system administrator or refer to the user
          documentation.
        </p>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";

export default defineComponent({
  name: "NotFoundView",
});
</script>

<style scoped>
.about {
  max-width: 1200px;
  margin: 0 auto;
}

h1 {
  color: #2c3e50;
  margin-bottom: 2rem;
  text-align: center;
}

.about-content {
  background-color: #f8f9fa;
  padding: 2rem;
  border-radius: 8px;
}

.info-section {
  margin-bottom: 2rem;
}

.info-section:last-child {
  margin-bottom: 0;
}

.info-section h2 {
  color: #34495e;
  margin-bottom: 1rem;
  border-bottom: 2px solid #3498db;
  padding-bottom: 0.5rem;
}

.features-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 1.5rem;
  margin-top: 1rem;
}

.feature-card {
  background-color: white;
  padding: 1.5rem;
  border-radius: 8px;
  border: 1px solid #dee2e6;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.feature-card h3 {
  color: #2c3e50;
  margin-bottom: 1rem;
}

.feature-card p {
  color: #6c757d;
  line-height: 1.5;
}

.version-table {
  width: 100%;
  max-width: 400px;
  border-collapse: collapse;
  background-color: white;
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.version-table td {
  padding: 0.75rem;
  border-bottom: 1px solid #dee2e6;
}

.version-table tr:last-child td {
  border-bottom: none;
}

.version-table td:first-child {
  background-color: #f8f9fa;
  width: 40%;
}

p {
  line-height: 1.6;
  color: #495057;
}
</style>

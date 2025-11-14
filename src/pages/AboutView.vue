<template>
  <div class="about">
    <h1>About SDM Subscriptions</h1>
    <div class="about-content">
      <div class="info-section">
        <h2>System Overview</h2>
        <p>
          SDM Subscriptions is a comprehensive subscription management system
          designed to handle distributor and manufacturer relationships in the
          supply chain management ecosystem.
        </p>
      </div>

      <div class="info-section">
        <h2>Key Features</h2>
        <div class="features-grid">
          <div class="feature-card">
            <h3>Admin Management</h3>
            <p>
              Manage distributors and manufacturers with comprehensive admin
              tools.
            </p>
          </div>
          <div class="feature-card">
            <h3>Process Management</h3>
            <p>Handle date period processing and generate custom reports.</p>
          </div>
          <div class="feature-card">
            <h3>Reporting</h3>
            <p>Create detailed custom reports with multiple export options.</p>
          </div>
        </div>
      </div>

      <div class="info-section">
        <h2>Version Information</h2>
        <table class="version-table">
          <tbody>
            <tr>
              <td><strong>Version:</strong></td>
              <td>1.0.0</td>
            </tr>
            <tr>
              <td><strong>Built with:</strong></td>
              <td>Vue.js 3, TypeScript, Vue Router</td>
            </tr>
            <tr>
              <td><strong>Last Updated:</strong></td>
              <td>{{ new Date().toLocaleDateString() }}</td>
            </tr>
          </tbody>
        </table>
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

// import global styles from assets/global_styles.scss
import "@/assets/global_styles.scss";

export default defineComponent({
  name: "AboutView",
});
</script>

<style scoped>
.about {
  max-width: 1200px;
  margin: 0 auto;
}
</style>

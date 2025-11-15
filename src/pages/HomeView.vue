<template>
  <div class="home">
    <div class="hero-section">
      <h1>{{ appTitle }}</h1>
      <p class="hero-subtitle">
        Your comprehensive subscription management system for distributors and
        manufacturers
      </p>
    </div>

    <div class="features-section">
      <div class="feature-grid">
        <router-link to="/admin/distributors" class="feature-card">
          <div class="feature-icon">👥</div>
          <h3>Distributors</h3>
          <p>Manage distributor information and relationships</p>
        </router-link>

        <router-link to="/admin/manufacturers" class="feature-card">
          <div class="feature-icon">🏭</div>
          <h3>Manufacturers</h3>
          <p>Handle manufacturer profiles and agreements</p>
        </router-link>

        <router-link to="/process/date-period" class="feature-card">
          <div class="feature-icon">📅</div>
          <h3>Date Period</h3>
          <p>Process data for specific date ranges</p>
        </router-link>

        <router-link to="/process/custom-reports" class="feature-card">
          <div class="feature-icon">📊</div>
          <h3>Custom Reports</h3>
          <p>Generate detailed custom reports</p>
        </router-link>
      </div>
    </div>

    <div class="quick-stats">
      <h2>System Overview {{ appVersion }}</h2>
      <div class="stats-grid">
        <div class="stat-item">
          <span class="stat-number">0</span>
          <span class="stat-label">Active Distributors</span>
        </div>
        <div class="stat-item">
          <span class="stat-number">0</span>
          <span class="stat-label">Manufacturers</span>
        </div>
        <div class="stat-item">
          <span class="stat-number">0</span>
          <span class="stat-label">Reports Generated</span>
        </div>
        <div class="stat-item">
          <span class="stat-number">0</span>
          <span class="stat-label">Active Subscriptions</span>
        </div>
      </div>
    </div>
  </div>
</template>
<script setup lang="ts">
import { ref } from "vue";

const appTitle = ref(
  process.env.APP_VITE_APP_TITLE || "Define the VITE Variables"
);
const appVersion = ref(
  process.env.APP_VITE_APP_VERSION || "9.9.9"
);
</script>

<script lang="ts">
import { defineComponent } from "vue";

export default defineComponent({
  name: "HomeView",
});
</script>

<style scoped>
.home {
  max-width: 1200px;
  margin: 0 auto;
}

.hero-section {
  text-align: center;
  padding: 3rem 0;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  border-radius: 16px;
  color: white;
  margin-bottom: 3rem;
}

.hero-section h1 {
  font-size: 3rem;
  margin-bottom: 1rem;
  font-weight: 700;
}

.hero-subtitle {
  font-size: 1.25rem;
  opacity: 0.9;
  max-width: 600px;
  margin: 0 auto;
  line-height: 1.6;
}

.features-section {
  margin-bottom: 3rem;
}

.feature-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 1.5rem;
}

.feature-card {
  background-color: white;
  padding: 2rem;
  border-radius: 12px;
  text-decoration: none;
  color: inherit;
  border: 2px solid transparent;
  transition: all 0.3s ease;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  text-align: center;
}

.feature-card:hover {
  transform: translateY(-4px);
  border-color: #3498db;
  box-shadow: 0 8px 25px rgba(52, 152, 219, 0.15);
}

.feature-icon {
  font-size: 2.5rem;
  margin-bottom: 1rem;
}

.feature-card h3 {
  color: #2c3e50;
  margin-bottom: 0.5rem;
  font-size: 1.5rem;
}

.feature-card p {
  color: #6c757d;
  line-height: 1.5;
}

.quick-stats {
  background-color: #f8f9fa;
  padding: 2rem;
  border-radius: 12px;
}

.quick-stats h2 {
  text-align: center;
  color: #2c3e50;
  margin-bottom: 2rem;
}

.stats-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 1.5rem;
}

.stat-item {
  text-align: center;
  background-color: white;
  padding: 1.5rem;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.stat-number {
  display: block;
  font-size: 2.5rem;
  font-weight: bold;
  color: #3498db;
  margin-bottom: 0.5rem;
}

.stat-label {
  color: #6c757d;
  font-size: 0.9rem;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

/* Responsive design */
@media (max-width: 768px) {
  .hero-section {
    padding: 2rem 1rem;
  }

  .hero-section h1 {
    font-size: 2rem;
  }

  .hero-subtitle {
    font-size: 1rem;
  }

  .feature-grid {
    grid-template-columns: 1fr;
  }

  .stats-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}
</style>

<template>
  <nav class="navbar">
    <ul class="navbar-nav">
      <li
        class="nav-item dropdown"
        @mouseenter="showDropdown('admin')"
        @mouseleave="hideDropdown('admin')"
      >
        <a href="#" class="nav-link" @click.prevent="">
          Admin
          <span class="dropdown-arrow">▼</span>
        </a>
        <ul class="dropdown-menu" v-show="activeDropdown === 'admin'">
          <li>
            <router-link to="/admin/distributors" class="dropdown-link"
              >Distributors</router-link
            >
          </li>
          <li>
            <router-link to="/admin/manufacturers" class="dropdown-link"
              >Manufacturers</router-link
            >
          </li>
        </ul>
      </li>

      <li
        class="nav-item dropdown"
        @mouseenter="showDropdown('process')"
        @mouseleave="hideDropdown('process')"
      >
        <a href="#" class="nav-link" @click.prevent="">
          Process
          <span class="dropdown-arrow">▼</span>
        </a>
        <ul class="dropdown-menu" v-show="activeDropdown === 'process'">
          <li>
            <router-link to="/process/date-period" class="dropdown-link"
              >Date Period</router-link
            >
          </li>
          <li>
            <router-link to="/process/custom-reports" class="dropdown-link"
              >Custom Reports</router-link
            >
          </li>
        </ul>
      </li>

      <li
        class="nav-item dropdown"
        @mouseenter="showDropdown('help')"
        @mouseleave="hideDropdown('help')"
      >
        <a href="#" class="nav-link" @click.prevent="">
          Help
          <span class="dropdown-arrow">▼</span>
        </a>
        <ul class="dropdown-menu" v-show="activeDropdown === 'help'">
          <li>
            <router-link to="/help/about" class="dropdown-link"
              >About</router-link
            >
          </li>
        </ul>
      </li>
    </ul>
  </nav>
</template>

<script lang="ts">
import { defineComponent, ref } from "vue";

export default defineComponent({
  name: "NavigationMenu",
  setup() {
    const activeDropdown = ref<string | null>(null);

    const showDropdown = (menu: string) => {
      activeDropdown.value = menu;
    };

    const hideDropdown = (menu: string) => {
      // Add a small delay to prevent flickering when moving between menu items
      setTimeout(() => {
        if (activeDropdown.value === menu) {
          activeDropdown.value = null;
        }
      }, 100);
    };

    return {
      activeDropdown,
      showDropdown,
      hideDropdown,
    };
  },
});
</script>

<style scoped>
.navbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background-color: #dfdede;
  padding: 0 2rem;
  /* box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); */
  --bs-bg-opacity: 0.25;
  color: #000000;
  border-color: #000000;
}

.navbar-brand {
  font-size: 1.5rem;
  font-weight: bold;
  color: #000000;
}

.brand-link {
  color: #ecf0f1;
  text-decoration: none;
  transition: color 0.3s ease;
}

.brand-link:hover {
  color: #dfdede;
}

.navbar-nav {
  display: flex;
  list-style: none;
  margin: 0;
  padding: 0;
}

.nav-item {
  position: relative;
  margin: 0 1rem;
}

.nav-link {
  display: flex;
  align-items: center;
  color: #000000;
  text-decoration: none;
  padding: 1rem 0.5rem;
  transition: color 0.3s ease;
  cursor: pointer;
}

.nav-link:hover {
  color: #8d55e7;
}

.dropdown-arrow {
  margin-left: 0.5rem;
  font-size: 0.8rem;
  transition: transform 0.2s ease;
}

.nav-item:hover .dropdown-arrow {
  transform: rotate(180deg);
}

.dropdown-menu {
  position: absolute;
  top: 100%;
  left: 0;
  background-color: #dfdede;
  min-width: 180px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  border-radius: 4px;
  padding: 0.5rem 0;
  list-style: none;
  margin: 0;
  z-index: 1000;
}

.dropdown-menu li {
  margin: 0;
}

.dropdown-link {
  display: block;
  color: #8d55e7;
  text-decoration: none;
  padding: 0.75rem 1.5rem;
  transition: background-color 0.3s ease;
}

.dropdown-link:hover {
  background-color: #8d55e7;
  color: white;
}

.router-link-active {
  color: #3498db !important;
}
</style>

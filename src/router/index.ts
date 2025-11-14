import { createRouter, createWebHistory, RouteRecordRaw } from "vue-router";
import HomeView from "../pages/HomeView.vue";

const routes: Array<RouteRecordRaw> = [
  {
    path: "/",
    name: "home",
    component: HomeView,
  },
  {
    path: "/about",
    name: "about",
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () =>
      import(/* webpackChunkName: "about" */ "../pages/AboutView.vue"),
  },
  // Admin routes
  {
    path: "/admin/distributors",
    name: "admin-distributors",
    component: () =>
      import(
        /* webpackChunkName: "admin-distributors" */ "../pages/admin/DistributorsView.vue"
      ),
  },
  {
    path: "/admin/manufacturers",
    name: "admin-manufacturers",
    component: () =>
      import(
        /* webpackChunkName: "admin-manufacturers" */ "../pages/admin/ManufacturersView.vue"
      ),
  },
  // Process routes
  {
    path: "/process/date-period",
    name: "process-date-period",
    component: () =>
      import(
        /* webpackChunkName: "process-date-period" */ "../pages/process/DatePeriodView.vue"
      ),
  },
  {
    path: "/process/custom-reports",
    name: "process-custom-reports",
    component: () =>
      import(
        /* webpackChunkName: "process-custom-reports" */ "../pages/process/CustomReportsView.vue"
      ),
  },
  // Help routes
  {
    path: "/help/about",
    name: "help-about",
    component: () =>
      import(/* webpackChunkName: "help-about" */ "../pages/AboutView.vue"),
  },
  // unknown route fallback
  {
    path: "/:catchAll(.*)",
    name: "not-found",
    component: () =>
      import(/* webpackChunkName: "not-found" */ "../pages/NotFound.vue"),
  },
];

const router = createRouter({
  history: createWebHistory("/"),
  routes,
});

export default router;

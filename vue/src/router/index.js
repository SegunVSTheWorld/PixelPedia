import Vue from 'vue'
import Router from 'vue-router'
import Home from '../views/Home.vue'
import Login from '../views/Login.vue'
import Logout from '../views/Logout.vue'
import Register from '../views/Register.vue'
import store from '../store/index'
import videogamedetails from '../views/VideoGameDetailView.vue'
import addvideogame from '../views/AddVideoGameView.vue'
import deletevideogame from '../views/ConfirmDeleteView.vue'
import editvideogame from '../views/EditVideoGameView.vue'
import emulatorlist from '../views/emulatorView.vue'
import gameboyadvance from '../views/gbaEmulator.vue'
import ps1Emulator from '../views/ps1Emulator'
import userprofile from '../views/UserProfileView.vue'
import editprofile from '../views/EditProfileView.vue'

Vue.use(Router)

/**
 * The Vue Router is used to "direct" the browser to render a specific view component
 * inside of App.vue depending on the URL.
 *
 * It also is used to detect whether or not a route requires the user to have first authenticated.
 * If the user has not yet authenticated (and needs to) they are redirected to /login
 * If they have (or don't need to) they're allowed to go about their way.
 */

const router = new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/login",
      name: "login",
      component: Login,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/logout",
      name: "logout",
      component: Logout,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/register",
      name: "register",
      component: Register,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/videogamedetails/:id",
      name: "videogamedetails",
      component: videogamedetails,

    },
    {
      path: '/addvideogame',
      name: "addvideogame",
      component: addvideogame
    },
    {
      path: '/deletevideogame/:id',
      name: 'deletevideogame',
      component: deletevideogame
    },
    {
      path: '/editvideogame/:id',
      name: 'editvideogame',
      component: editvideogame
    },
    {
      path: '/emulatorlist',
      name: 'emulatorlist',
      component: emulatorlist
    },
    {
      path: '/emulatorlist/gba',
      name: 'gameboyadvance',
      component: gameboyadvance
    },
    {
      path: '/emulatorlist/psp',
      name: 'gameboyadvance',
      component: gameboyadvance
    },
    {
      path: '/emulatorlist/ps1',
      name: 'ps1',
      component: ps1Emulator
    },
    {
      path: '/user/:id',
      name: 'viewprofile',
      component: userprofile
    },
    {
      path: '/editprofile',
      name: 'editprofile',
      component: editprofile
    }

  ]
})

router.beforeEach((to, from, next) => {
  // Determine if the route requires Authentication
  const requiresAuth = to.matched.some(x => x.meta.requiresAuth);

  // If it does and they are not logged in, send the user to "/login"
  if (requiresAuth && store.state.token === '') {
    next("/login");
  } else {
    // Else let them go to their next destination
    next();
  }
});

export default router;

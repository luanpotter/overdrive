'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "favicon.png": "5dcef449791fa27946b3d35ad8803796",
"main.dart.js": "359acf9ec5917c9ff8501bfab87e12dd",
"index.html": "274ecea8d10df25244476954ef056c48",
"/": "274ecea8d10df25244476954ef056c48",
"flutter.js": "f85e6fb278b0fd20c349186fb46ae36d",
"manifest.json": "da28dc13d69f80c746be6ef3d66cf34c",
"canvaskit/canvaskit.js": "2bc454a691c631b07a9307ac4ca47797",
"canvaskit/canvaskit.wasm": "bf50631470eb967688cca13ee181af62",
"canvaskit/profiling/canvaskit.js": "38164e5a72bdad0faa4ce740c9b8e564",
"canvaskit/profiling/canvaskit.wasm": "95a45378b69e77af5ed2bc72b2209b94",
"assets/AssetManifest.json": "0740b27e2f6cec2a7311252abe8040b7",
"assets/shaders/ink_sparkle.frag": "237ceacd6c04871e538aaa934b1327a3",
"assets/packages/overdrive_components/assets/sfx/car_leaving.mp3": "92add4ab8cd5fb6ee0bd48b8899f047e",
"assets/packages/overdrive_components/assets/sfx/tire_fixer.mp3": "3b0427a1d5cd9b196bc7c5d0f19ae4b6",
"assets/packages/overdrive_components/assets/sfx/screw_driver.mp3": "2634b099bcd5c14e11eb706f61a62368",
"assets/packages/overdrive_components/assets/sfx/car_arriving.mp3": "699e7f957d0b68a92678add6000757f1",
"assets/packages/overdrive_components/assets/images/tire_fixer.png": "e017968af6977bac787270c9e7a24968",
"assets/packages/overdrive_components/assets/images/toolbox.png": "19496104df6b9375c21ad314124fdfea",
"assets/packages/overdrive_components/assets/images/car_wheel.png": "adade10b12f88e1c20ace791ef22d171",
"assets/packages/overdrive_components/assets/images/car/car_front_cyan.png": "aef0db915d3469b72eae75c821fa80d0",
"assets/packages/overdrive_components/assets/images/car/car_front_green.png": "01d0fc47f9f37442f266e181b76f1622",
"assets/packages/overdrive_components/assets/images/car/car_front_red.png": "d5cca07d6ad0e48aaae83a98f405bb53",
"assets/packages/overdrive_components/assets/images/car/car_front_blue.png": "3934cbae3a25df4dd4ace9d9cd17243e",
"assets/packages/overdrive_components/assets/images/car/tyre_damaged.png": "b49189341a5101a2edefc72d5f8ab7a8",
"assets/packages/overdrive_components/assets/images/car/car_back.png": "d4e02b28658d666be09e17d472ecc5d5",
"assets/packages/overdrive_components/assets/images/car/tyre.png": "3654ccbb6477d29caf75cfd7521ebbb5",
"assets/packages/overdrive_components/assets/images/car/car_front_yellow.png": "22e9b590394c0b477bdebf7494512fa9",
"assets/packages/overdrive_components/assets/images/tire-fixer-workbench.png": "aec424a034608dd64d14dbb7b629a2f9",
"assets/packages/overdrive_components/assets/images/reference.png": "4aa0a17e1ed092e3424bf46848ecd50f",
"assets/packages/overdrive_components/assets/images/screw-driver-tool.png": "a3f624b0151c1097e8f511548b675815",
"assets/packages/overdrive_components/assets/images/floor_pattern.png": "364b70b276357dd3b833d0c829377cb4",
"assets/packages/overdrive_components/assets/images/characters/male_2.png": "e6de613264f34ddab6c76e6276d0209a",
"assets/packages/overdrive_components/assets/images/characters/male_3.png": "0f972598bec8c5a1d4ef000cc51b2401",
"assets/packages/overdrive_components/assets/images/characters/female_2.png": "d0ab5df89490f80dd0f3e4e1a7ff99c8",
"assets/packages/overdrive_components/assets/images/characters/female_3.png": "b5c1a1e0ea5bd8ddd02496cad4e09487",
"assets/packages/overdrive_components/assets/images/characters/female_1.png": "9bc00ab09d8ecb8863da07b15663922b",
"assets/packages/overdrive_components/assets/images/characters/male_1.png": "75314bce11109e3aa436cef51f5de53a",
"assets/packages/overdrive_components/assets/images/title_screen/title.png": "444323e178a14464e2744c1b9bd84b80",
"assets/packages/overdrive_components/assets/images/title_screen/wheel.png": "3f97861ab2bf7b7e70c4a877143dbe94",
"assets/packages/overdrive_components/assets/images/title_screen/scared_char.png": "fd9b19f641bfed1f538841c3365969d8",
"assets/packages/overdrive_components/assets/images/car_frame.png": "3869614f7dcd9425951bba3808a50b70",
"assets/packages/overdrive_components/assets/images/car_spot.png": "9561d5cc6d1a1bbfe74724d92508bf43",
"assets/packages/overdrive_components/assets/images/player.png": "1182a8e10522ca7376aca3a8f29feb5d",
"assets/packages/overdrive_components/assets/bgm.mp3": "125fcdbca0ae0c652212fd7c6554cadc",
"assets/FontManifest.json": "bb75b83f40ad7528580899da96924266",
"assets/assets/fonts/Monoton-Regular.ttf": "d20753b0996b7092460eef623995f880",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/NOTICES": "b5ea013a2988566d46e5181239ffe45c",
"version.json": "88a0a28eabeb0e88e4cc3958dbea672a",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}

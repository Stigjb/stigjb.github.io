<script lang="js">
	import { onMount } from 'svelte';
	import dieselIconUrl from '$lib/icons/diesel.svg';
	import bensinIconUrl from '$lib/icons/bensin.svg';
	import elIconUrl from '$lib/icons/electric.svg';

	let L = undefined;

	onMount(async () => {
		const module = await import('leaflet');
		L = module.default;
		useFetch();
	});

	const useData = (data) => {
		const bensinIcon = L.icon({
			iconUrl: bensinIconUrl,
			iconSize: [24, 24],
			iconAnchor: [12, 22]
		});
		const elIcon = L.icon({
			iconUrl: elIconUrl,
			iconSize: [24, 24],
			iconAnchor: [12, 22]
		});
		const dieselIcon = L.icon({
			iconUrl: dieselIconUrl,
			iconSize: [24, 24],
			iconAnchor: [12, 22]
		});
		const center = [Number.parseFloat(data.latitude), Number.parseFloat(data.longitude)];
		const zoom = Number.parseFloat(data.zoom);
		const map = L.map('map').setView(center, zoom);
		L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
			maxZoom: 19,
			attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
		}).addTo(map);
		const layers = {};
		data.all_cars.forEach((car) => {
			let icon = bensinIcon;
			if (car.fuel_type === 'electric') {
				icon = elIcon;
			} else if (car.fuel_type === 'diesel') {
				icon = dieselIcon;
			}
			const center = [Number.parseFloat(car.center_lat), Number.parseFloat(car.center_lng)];
			const marker = L.marker(center, { icon });
			marker.bindPopup(car.name);
			car.vehicle_categories.forEach((vCat) => {
				const carType = vCat.name;
				if (!layers[carType]) {
					layers[carType] = L.layerGroup().addTo(map);
				}
				let layer = layers[carType];
				marker.addTo(layer);
			});
		});
		Object.values(layers).forEach((layer) => map.addLayer(layer));
		L.control.layers(null, layers).addTo(map);
	};

	const useFetch = () => {
		fetch('https://bilkollektivet.no/wp-json/bilkollektivet_api/get_map_init_object/', {
			headers: {
				Accept: '*/*'
			},
			method: 'POST'
		})
			.then((response) => response.json())
			.then((data) => {
				useData(data);
			});
	};
</script>

<svelte:head>
	<link
		rel="stylesheet"
		href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
		integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY="
		crossorigin=""
	/>
</svelte:head>

<h2>Bilkollektivet</h2>

<p>
	Jeg er ikke fornøyd med Bilkollektivets eget kart, det har nemlig begrenset mulighet for å
	filtrere og viser ikke alle bilene om gangen. Derfor har jeg laget et eget kart som viser alle
	bilene på en gang.
</p>

<p>
	Dataen er hentet fra Bilkollektivets API, men jeg kan ikke garantere at det er stabilt. Hvis det
	ikke er noen synlige markører i kartet, kan det være at API-et er nede.
</p>

<div id="map" style="height: 400px;" />

<style>
	#map {
		height: 600px;
	}
</style>

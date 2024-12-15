document.addEventListener('DOMContentLoaded', function () {
  var map = L.map('map').setView([@property.latitude, @property.longitude], 13); // Usa las coordenadas de la propiedad

  // Agregar capa de mapas (usando OpenStreetMap como ejemplo)
  L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
  }).addTo(map);

  // Agregar un marcador en la ubicación de la propiedad
  L.marker([@property.latitude, @property.longitude]).addTo(map)
    .bindPopup("<b>Ubicación de la propiedad</b>")
    .openPopup();
});

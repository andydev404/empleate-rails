provinces = [
  { title: 'Azua' },
  { title: 'Bahoruco' },
  { title: 'Barahona' },
  { title: 'Dajabón' },
  { title: 'Distrito Nacional' },
  { title: 'Duarte' },
  { title: 'Elías Piña' },
  { title: 'El Seibo' },
  { title: 'Espaillat' },
  { title: 'Hato Mayor' },
  { title: 'Hermanas Mirabal' },
  { title: 'Independencia' },
  { title: 'La Altagracia' },
  { title: 'La Romana' },
  { title: 'La Vega' },
  { title: 'María Trinidad Sánchez' },
  { title: 'Monseñor Nouel' },
  { title: 'Monte Cristi' },
  { title: 'Monte Plata' },
  { title: 'Pedernales' },
  { title: 'Peravia' },
  { title: 'Puerto Plata' },
  { title: 'Samaná' },
  { title: 'Sánchez Ramírez' },
  { title: 'San Cristóbal' },
  { title: 'San José de Ocoa' },
  { title: 'San Juan' },
  { title: 'San Pedro de Macorís' },
  { title: 'Santiago' },
  { title: 'Santiago Rodríguez' },
  { title: 'Santo Domingo' },
  { title: 'Valverde' },
]

provinces.each do |province|
  Province.create!(province)
end
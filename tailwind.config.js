const defaultTheme = require('tailwindcss/defaultTheme');

const defaultColors = {
  dark: '#001e00',
  'light-dark': '#65735b',
  primary: '#15A800',
  'dark-primary': '#3C8224',
  'light-primary': '#F7FCF8',
};

module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Montserrat', ...defaultTheme.fontFamily.sans],
      },
      textColor: defaultColors,
      backgroundColor: defaultColors,
      borderColor: defaultColors,
    },
  },
  plugins: [
    require('@tailwindcss/custom-forms'),
    require('@tailwindcss/forms')
  ]
}

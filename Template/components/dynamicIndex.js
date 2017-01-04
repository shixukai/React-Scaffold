export const Template = (location, callback) => {
  require.ensure([], require => {
    callback(null, require('./Template.js').default)
  }, 'Template')
}

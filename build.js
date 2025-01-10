const esbuild = require('esbuild');

esbuild.build({
  entryPoints: ['./app/javascript/application.js'],
  bundle: true,
  outdir: './app/assets/builds',
  minify: process.env.RAILS_ENV === 'production',
  sourcemap: true,
  loader: { '.js': 'jsx', '.scss': 'css' },
}).catch(() => process.exit(1));

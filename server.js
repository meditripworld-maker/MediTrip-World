const express = require('express');
const path = require('path');
const app = express();
const PORT = process.env.PORT || 3000;

// Force HTTPS (Railway terminates SSL at load balancer, sets x-forwarded-proto)
// Railway can send comma-separated values e.g. "http,https" — check the first value
app.use((req, res, next) => {
  const proto = req.headers['x-forwarded-proto'];
  const firstProto = proto ? proto.split(',')[0].trim() : null;
  if (firstProto && firstProto !== 'https') {
    return res.redirect(301, 'https://' + req.headers.host + req.url);
  }
  next();
});

// Security headers (fixes "insecure connection" warnings)
app.use((req, res, next) => {
  res.setHeader('Strict-Transport-Security', 'max-age=31536000; includeSubDomains; preload');
  res.setHeader('X-Content-Type-Options', 'nosniff');
  res.setHeader('X-Frame-Options', 'SAMEORIGIN');
  res.setHeader('Referrer-Policy', 'strict-origin-when-cross-origin');
  next();
});

app.use(express.static(path.join(__dirname), {
  setHeaders: (res, filePath) => {
    if (filePath.endsWith('.html')) {
      res.setHeader('Cache-Control', 'no-cache');
    } else {
      res.setHeader('Cache-Control', 'public, max-age=86400');
    }
  }
}));

app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, 'index.html'));
});

app.listen(PORT, () => {
  console.log(`MediTrip live on port ${PORT}`);
});

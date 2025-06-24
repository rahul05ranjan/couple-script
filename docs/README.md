# CoupleScript Documentation Website

This directory contains the GitHub Pages website for CoupleScript. The site is built using Jekyll and hosted at https://rahul05ranjan.github.io/couple-script.

## Files Structure

- `index.html` - Beautiful standalone HTML page with modern design
- `index_new.md` - Jekyll-compatible markdown version  
- `examples.md` - Example programs and tutorials
- `installation.md` - Installation guide
- `api.md` - API reference and language documentation
- `_config.yml` - Jekyll configuration

## Local Development

To test the site locally:

```bash
# Install Jekyll (one-time setup)
gem install bundler jekyll

# Serve the site locally
cd docs
jekyll serve

# View at http://localhost:4000
```

## GitHub Pages Setup

The site is automatically deployed to GitHub Pages when changes are pushed to the main branch. GitHub Pages configuration:

- **Source**: Deploy from `/docs` folder
- **Theme**: Custom with romantic styling
- **URL**: https://rahul05ranjan.github.io/couple-script

## Features

### Beautiful Design
- 💕 Romantic color scheme with gradients
- 🎨 Modern responsive layout
- ✨ Animated elements and floating hearts
- 📱 Mobile-friendly design

### Comprehensive Content
- 🚀 Quick start guide
- 💡 Interactive code examples
- 📚 Complete language reference
- 🎯 Installation instructions for all platforms
- 🤝 Community and contribution guidelines

### SEO Optimized
- Open Graph meta tags for social sharing
- Twitter Card support
- Semantic HTML structure
- Fast loading performance

## Updating the Site

1. Edit the appropriate `.md` or `.html` files
2. Test locally with `jekyll serve`
3. Commit and push to main branch
4. GitHub Pages will automatically deploy

## Customization

The site uses CSS custom properties for easy theming:

```css
:root {
    --primary-pink: #ff69b4;
    --secondary-pink: #ffb6c1;
    --accent-red: #ff1744;
    --gradient-romantic: linear-gradient(135deg, #ff69b4 0%, #ff1744 100%);
}
```

Feel free to adjust colors and styles to match your vision for CoupleScript! 💕

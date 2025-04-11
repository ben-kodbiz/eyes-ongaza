# Palestine News Site - Content Guide

This guide explains how to add new content to your Palestine News site.

## Adding New Content

You have three ways to add new content:

### 1. Using the Templates Page (Easiest)

1. Visit the templates page at [http://127.0.0.1:4000/admin/](http://127.0.0.1:4000/admin/) when running locally
2. Choose either the Poem Template or Article Template tab
3. Click in the text area to select all the template content
4. Copy the template to your clipboard
5. Create a new file in your text editor with the appropriate filename format:
   - For poems: `YYYY-MM-DD-title-of-poem.md` in the `_poems` directory
   - For articles: `YYYY-MM-DD-title-of-article.md` in the `_articles_history` directory
6. Paste the template and replace the placeholder values with your content
7. Save the file and the site will automatically update if you're running Jekyll with livereload

### 2. Using the Helper Script

1. Run the helper script from the terminal:
   ```
   ./add-content.sh
   ```
2. Follow the prompts to enter information about your poem or article
3. The script will create the file for you in the correct directory
4. Edit the file to add your actual content

### 3. Manually Creating Files

#### For Poems:

1. Create a new file in the `_poems` directory with a filename following this pattern:
   - Format: `YYYY-MM-DD-title-of-poem.md`
   - Example: `2024-04-15-resilience-of-gaza.md`

2. Add front matter at the top of the file:
   ```
   ---
   layout: poem
   title: "Title of Your Poem"
   date: 2024-04-15
   author: "Poet's Name"
   dedication: "Who the poem is dedicated to"
   image: "/assets/images/optional-image.jpg"  # Optional
   ---

   *A poem dedicated to [dedication]*

   ## [Title]

   Your poem content goes here...

   *In memory of those who have lost their lives in Palestine*
   ```

#### For Articles:

1. Create a new file in the `_articles_history` directory:
   - Format: `YYYY-MM-DD-title-of-article.md`
   - Example: `2024-04-15-history-of-palestinian-resistance.md`

2. Add front matter at the top of the file:
   ```
   ---
   layout: post
   title: "Title of Your Article"
   date: 2024-04-15
   author: "Author's Name"
   categories: ["History", "Resistance"]  # Add relevant categories
   image: "/assets/images/optional-image.jpg"  # Optional
   ---

   Your article content goes here...
   ```

## Adding Images

If you want to include images with your content:

1. Place the image files in the `assets/images` directory
2. Reference them in your content using:
   ```
   ![Description](/assets/images/your-image.jpg)
   ```
3. For featured images (that appear in cards), add the image path to the front matter:
   ```
   image: "/assets/images/your-image.jpg"
   ```

## Markdown Formatting

You can use Markdown formatting in your content:

- `# Heading 1`, `## Heading 2`, etc. for headings
- `*italic text*` for italic text
- `**bold text**` for bold text
- `[Link text](https://example.com)` for links
- `![Image description](/path/to/image.jpg)` for images
- ```
  > This is a blockquote
  ```
- Lists:
  ```
  - Item 1
  - Item 2
  - Item 3
  ```

## After Adding Content

After adding new content:

1. The site will automatically rebuild if you're running it locally with `bundle exec jekyll serve --livereload`
2. Your new content should appear in the appropriate section of the site
3. If you're deploying to GitHub Pages or another hosting service, commit and push your changes to update the live site:

```bash
git add .
git commit -m "Add new poem/article: [Title]"
git push
```

## Security Note

The admin page only works when running the site locally. This ensures that only you can add content to your site, and there's no risk of anonymous users posting content.

The content creation process is entirely client-side - files are generated in your browser and downloaded to your computer. You then manually move them to the appropriate directory. This approach ensures complete control over what gets published to your site.

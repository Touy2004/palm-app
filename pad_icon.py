from PIL import Image

# Open the original image
img = Image.open('assets/icons/app_icon.png').convert("RGBA")

# Create a new transparent background image
bg = Image.new('RGBA', (1024, 1024), (0, 0, 0, 0))

# Calculate new size (e.g. 75% of 1024 = 768)
new_size = int(1024 * 0.75)
img_resized = img.resize((new_size, new_size), Image.Resampling.LANCZOS)

# Calculate position to paste (center)
offset = ((1024 - new_size) // 2, (1024 - new_size) // 2)

# Paste the resized image onto the background
bg.paste(img_resized, offset, img_resized)

# Save as a new file
bg.save('assets/icons/app_icon_ios.png')

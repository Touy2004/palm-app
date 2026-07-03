import qrcode

# ==========================================
# PASTE YOUR REAL SESSION TOKEN HERE
# ==========================================
SESSION_TOKEN = "209dad9d6948c8721522f5b44e1fde7d"

def generate_qr(session_token, output_file="pairing_qr.png"):
    # Generate QR code
    qr = qrcode.QRCode(
        version=1,
        error_correction=qrcode.constants.ERROR_CORRECT_L,
        box_size=10,
        border=4,
    )
    qr.add_data(session_token)
    qr.make(fit=True)

    # Create an image from the QR Code instance
    img = qr.make_image(fill_color="black", back_color="white")
    
    # Save it
    img.save(output_file)
    print(f"✅ Successfully generated QR code for session token '{session_token}'")
    print(f"Saved to: {output_file}")

if __name__ == "__main__":
    generate_qr(SESSION_TOKEN)

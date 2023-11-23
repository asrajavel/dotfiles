import PyPDF2

def rotate_alternate_pages(input_pdf_path, output_pdf_path):
    with open(input_pdf_path, 'rb') as file:
        pdf_reader = PyPDF2.PdfReader(file)
        pdf_writer = PyPDF2.PdfWriter()

        for page_num in range(len(pdf_reader.pages)):
            page = pdf_reader.pages[page_num]

            # Rotate alternate pages by 180 degrees
            if (page_num + 1) % 2 == 0:
                page.rotate(180)

            pdf_writer.add_page(page)

        with open(output_pdf_path, 'wb') as output_file:
            pdf_writer.write(output_file)

if __name__ == "__main__":
    input_pdf_path = "system print.pdf"
    output_pdf_path = "system print rotated.pdf"

    rotate_alternate_pages(input_pdf_path, output_pdf_path)

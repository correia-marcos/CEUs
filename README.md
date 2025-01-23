# Evaluation of the CEUs Model in São Paulo

This project aims to evaluate the general impact of the “Centro Educacional Unificado” (CEU) model of schools in the city of São Paulo, as well as to assess the additional benefits and feasibility provided by Public-Private Partnerships (PPP) and the concession to OSC (Organizações da Sociedade Civil).

## Project Structure

- **data/**
  Contains raw and processed data used in the analysis.

- **src/**
  Source scripts for data cleaning, model building, and analysis.

- **results/**
  Analysis outputs (figures, tables, summaries).

- **doc/**
  Documentation files, references, and other relevant materials.

- **renv/**
  R environment folder managed by `renv`, which stores dependencies and helps ensure reproducibility.

## Dependencies

- R version >= 4.0
- [renv](https://rstudio.github.io/renv/) for project environment and package management
- Additional CRAN packages: `tidyverse`, `data.table`, `sf` (update according to your needs)

## Usage

1. Clone the repository or download the project files.
2. Open `Coding.Rproj` in RStudio (recommended).
3. Use `renv::restore()` to install the required packages specified in `renv.lock`.
4. Run the scripts in `src/` to download, process, and analyze the data.

## License

This project is licensed under the [MIT License](LICENSE.md) – see the license file for details.

## Contact

For questions or collaboration, please reach out to [Your Name] at [your-email@example.com].

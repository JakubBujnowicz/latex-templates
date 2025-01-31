# Check if both directories exist
if [ ! -d "config" ] || [ ! -d "bibliography" ]; then
  # Change to the parent directory if either directory does not exist
  cd ..
fi

Rscript ./Rcode/compile_bibliography.R


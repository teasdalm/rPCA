#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include <time.h>
#include <boost/algorithm/string/split.hpp>
#include <boost/algorithm/string/classification.hpp>
#include <boost/algorithm/string.hpp>
#include <Rcpp.h>
using namespace Rcpp;

// Simple function to filter a ped file to make it homozygous

// [[Rcpp::export]]
int filter_ped(std::string input_file_name, std::string output_file_name){

  // some input file things
  std::string line;
  std::ifstream myfile(input_file_name);

  // some output file things
  std::ofstream myout;
  myout.open(output_file_name);

  // set random number
  srand(time(NULL));

  // read file
  if (myfile.is_open()){
    // iterating through the file
    while (getline (myfile,line)){
      // split string
      std::vector<std::string> tokens;
      boost::trim(line);
      boost::split(tokens, line, boost::is_any_of(" \t"));

      // print start of header
      myout << tokens[0]; // fam ID
      myout << ' ' <<tokens[1]; // sample ID
      myout << ' ' <<tokens[2]; // parents
      myout << ' ' <<tokens[3]; // parents
      myout << ' ' <<tokens[4]; // sex
      myout << ' ' <<tokens[5]; // status

      // print genotypes
      for(int j=6; j < tokens.size(); j +=2){
        int v1 = rand() % 2;
        if(v1 == 0){
          myout << ' ' << tokens[j] << ' ' << tokens[j];
        } else{
          myout << ' ' << tokens[j+1] << ' ' << tokens[j+1];
        }
      }
      // newline beween samples
      myout << std::endl;
    }
    // close file
    myfile.close();
    // close output
    myout.close();
    // can't open file
  } else {
    std::cerr << "Unable to open file \n";
    return 1;
  }
  // all is well
  std::cout << std::endl << "Finished filtering" << std::endl;
  return 0;
}



#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include <time.h>
#include <boost/algorithm/string.hpp>
#include <Rcpp.h>
using namespace Rcpp;

// Simple function to filter a ped file to make it homozygous
void make_hom(std::string ped_line){
  /*
  * Split the line by space or tab
  * Then print the line's header then
  *
  */
  std::vector<std::string> cols;
  boost::split(cols, ped_line, boost::is_any_of(" \t"));

  // print start of header
  std::cout << cols[0]; // fam ID
  std::cout << ' ' <<cols[1]; // sample ID
  std::cout << ' ' <<cols[2]; // parents
  std::cout << ' ' <<cols[3]; // parents
  std::cout << ' ' <<cols[4]; // sex
  std::cout << ' ' <<cols[5]; // status

  // print genotypes
  for(int j=6; j < cols.size(); j +=2){
    int v1 = rand() % 2;
    if(v1 == 0){
      std::cout << ' ' << cols[j] << ' ' << cols[j];
    } else{
      std::cout << ' ' << cols[j+1] << ' ' << cols[j+1];
    }
  }
  // newline beween samples
  std::cout << std::endl;
}

// [[Rcpp::export]]
void filter_ped(std::string input_file_name, std::string output_file_name){

  // some input file things
  std::string line;
  std::ifstream myfile(input_file_name);

  // some output file things
  std::ofstream myout;
  myout.open(output_file_name);

  // set random number
  srand(time(NULL));
  int ct = 0;
  // read file
  if (myfile.is_open()){
    // iterating through the file
    while (getline (myfile,line)){

      // Set a counter to update where we are
      ct++;
      if(ct % 100 == 0){
        std::cerr << "Processed " << ct << " samples" <<'\xd';
      };
      // trim string
      boost::trim(line);
      //Check the line isn't empty
      if(line.empty()){
        continue;
      } else{
        make_hom(line);
      }
    }
    // close file
    myfile.close();
    // can't open file
  } else {
    std::cerr << "Unable to open file \n";
  }
  // all is well
  std::cerr << std::endl << "Finished filtering" << std::endl;
}




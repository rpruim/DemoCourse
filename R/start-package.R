#' Favoraite package startup stuff
#'
#' Run a bunch of things from `devtools` to stub out a package.
#'
#' @param use_build_ignore A logical indicating whether I want to use a build ingore.
#'
#' @return Nothing.  Use for side-effects
#'
#' @examples
#' start_a_package()
#'
#' @export

start_a_package <- function(use_build_ignore = FALSE) {
   if (use_build_ignore) {
     use_build_ignore()
   }
   use_data_raw()
   use_github()
   use_readme_rmd()
 }

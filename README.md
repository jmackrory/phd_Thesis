# PhD_Thesis

My PhD thesis on computing the Electromagnetic Casimir force via the worldline method.
Partially successful at extending a technique in quantum field theory from scalar fields to 
electromagnetism.  Developed lots of analytical and numerical methods in close collaboration with
my advisor Dan Steck.

## Important files
- thesis_master.tex : master document that calls chapters, handles setup and bibliography.
- uothesis.cls: my own personal hacked uothesis class.  
    Allow subsubheadings in tableofcontents  
    Fixes pdf table of contents bookmarks (which no one else ever noticed?!)
    fixes spacing issues the gradschool cared about.
- Chapters: 
    1-introduction.tex: overview of Casimir forces, experiment and theory.  also intro to worldlines.
    2-field_quantization.tex: path integral quantization of EM field. 
    abortive attempt at full thing (ala Bordag), and planar decomposition into scalars (TE/TM)
    3-path_integrals.tex: basically feynman-kac formulae for various useful geometries
    4-analytical_results.tex: long chapter showing techniques for agreement with simple calculations
    5-numerical_results.tex:(long chapter on TE/TM numerical results and methods)
    6-numerical_force.tex: methods for computing gradients of path integrals. (analytical and numerical)
    conclusion.tex: a conclusion forced into being upbeat.
    abstract.tex: summary of the whole.
-fig directory -postscript source directory. Its a muddle of figures, split by "analytical" and "numerical" 
    figures with some cartoons.
-shortcuts.tex -where I defined my custom shortcuts, and loaded libraries.    

:- module(cutterdata, [
	      material/1,
	      mat_name/2,
	      isotropic/2,
	      tears_out/2,
	      tool_family/2,
	      sub_material/2,
	      condition/2
	  ]).
/** <module> Facts about various cutters
 *
 * */

:- discontiguous
	material/1,
	mat_name/2,
	isotropic/2,
	tears_out/2,
	tool_family/2,
	sub_material/2,
	condition/2.

mat(material, type, ceramic).
mat(material, type, metal).
mat(material, type, wood).
mat(material, type, polymer).
mat(material, type, glass).
mat(material, type, composite).

mat(composite, type, fiber_reinforced_glass).
mat(ceramic, type, porcelain).
mat(metal, type, ferrous).
mat(ferrous, type, wrought_iron).
mat(ferrous, type, steel).
mat(steel, type, mild_steel).
mat(steel, type, air_hardening_steel).
mat(steel, type, oil_hardening_steel).
mat(steel, type, water_hardening_steel).
mat(steel, type, hardened_steel).




%%	%%%%%%%%%%% the old stuff
%
%%	material(-Name:atom) is multi
%
%	internal names for material
%
material(soft_wood).
mat_name(soft_wood, 'Soft wood (fir, pine)'/en-us).
isotropic(soft_wood, no).
tears_out(soft_wood, easily).
tool_family(soft_wood, wood).
sub_material(soft_wood, fir).
sub_material(soft_wood, pine).
condition(soft_wood, green).
condition(soft_wood, dry).

material(hard_wood).
mat_name(hard_wood, 'Hard woods (oak, hickory, maple, and other woods from deciduous trees'/en-us).
isotropic(hard_wood, no).
tears_out(hard_wood, yes).
tool_family(hard_wood, wood).
sub_material(hard_wood, oak).
sub_material(hard_wood, hickory).
sub_material(hard_wood, maple).
% TODO complete this

material(mdf).
mat_name(mdf, 'MDF, medium density fiberboard, trade name masonite'/en-us).
isotropic(mdf, yes).
tears_out(mdf, no).
tool_family(mdf, wood).
condition(mdf, tempered).
condition(mdf, untempered).




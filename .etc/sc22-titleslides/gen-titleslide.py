# import jinja2
import argparse
from jinja2 import Environment, FileSystemLoader

def main(args):
	environment_tex = Environment(
	    block_start_string='((*',
	    block_end_string='*))',
	    variable_start_string='(((',
	    variable_end_string=')))',
	    comment_start_string='((=',
	    comment_end_string='=))',
	    # line_statement_prefix='%%',
	    # line_comment_prefix='%#',
	    trim_blocks=True,
	    autoescape=False,
	    loader=FileSystemLoader(".")
	)
	template = environment_tex.get_template(args.template)
	rendered = template.render(title=args.title, author=args.author)
	# print(rendered)
	with open(args.out, mode='w', encoding='utf-8') as output_file:
		output_file.write(rendered)


if __name__ == '__main__':
	parser = argparse.ArgumentParser(description='Generate LaTeX documents for title slides.')
	parser.add_argument('--title', '-t', help='Title of presentation (first line)', required=True)
	parser.add_argument('--author', '-a', help='Author of presentation (second line)', required=True)
	parser.add_argument('--out', '-o', help='Output file', required=True)
	parser.add_argument('--template', help='LaTeX template to use', default="title-slide.in.tex")

	args = parser.parse_args()
	print(args)
	main(args)
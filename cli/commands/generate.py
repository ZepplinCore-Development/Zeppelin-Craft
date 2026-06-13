"""
Gathering loot generation commands for F-001 profession tools.

Commands:
    zep world generate herbalism           Generate pruning shears bonus yield SQL
    zep world generate mining              Generate mining pick bonus yield SQL
    zep world generate skinning            Generate skinning knife bonus yield SQL
    zep world generate creature-gathering  Generate creature gathering bonus yield SQL
    zep world generate milling             Generate writing table bonus milling yield SQL
    zep world generate prospecting         Generate jeweler's kit bonus prospecting yield SQL
    zep world generate disenchant          Generate runed rod bonus disenchant yield SQL
    zep world generate all                 Generate all profession tool loot SQL
"""

from pathlib import Path

import click


@click.group()
@click.pass_context
def generate(ctx):
    """F-001 profession tool loot generators."""
    pass


@generate.command('herbalism')
@click.option('--output', '-o', type=click.Path(), default=None,
              help='Override output SQL file path.')
@click.pass_context
def gen_herbalism(ctx, output):
    """Generate pruning shears bonus yield SQL."""
    from lib.generate.herbalism import generate as run

    craft_root = ctx.obj['craft_root']
    output_path = Path(output) if output else None
    click.echo('Generating herbalism (pruning shears) loot...')
    result = run(craft_root, output_path)
    click.echo(click.style(f'  ✓ {result}', fg='green'))


@generate.command('mining')
@click.option('--output', '-o', type=click.Path(), default=None,
              help='Override output SQL file path.')
@click.pass_context
def gen_mining(ctx, output):
    """Generate mining pick bonus yield SQL."""
    from lib.generate.mining import generate as run

    craft_root = ctx.obj['craft_root']
    output_path = Path(output) if output else None
    click.echo('Generating mining (mining pick) loot...')
    result = run(craft_root, output_path)
    click.echo(click.style(f'  ✓ {result}', fg='green'))


@generate.command('skinning')
@click.option('--output', '-o', type=click.Path(), default=None,
              help='Override output SQL file path.')
@click.pass_context
def gen_skinning(ctx, output):
    """Generate skinning knife bonus yield SQL."""
    from lib.generate.skinning import generate as run

    craft_root = ctx.obj['craft_root']
    output_path = Path(output) if output else None
    click.echo('Generating skinning (skinning knife) loot...')
    result = run(craft_root, output_path)
    click.echo(click.style(f'  ✓ {result}', fg='green'))


@generate.command('creature-gathering')
@click.option('--output', '-o', type=click.Path(), default=None,
              help='Override output SQL file path.')
@click.pass_context
def gen_creature_gathering(ctx, output):
    """Generate creature gathering (herb/mining creatures) bonus yield SQL."""
    from lib.generate.creature_gathering import generate as run

    craft_root = ctx.obj['craft_root']
    output_path = Path(output) if output else None
    click.echo('Generating creature gathering loot...')
    result = run(craft_root, output_path)
    click.echo(click.style(f'  ✓ {result}', fg='green'))


@generate.command('milling')
@click.option('--output', '-o', type=click.Path(), default=None,
              help='Override output SQL file path.')
@click.pass_context
def gen_milling(ctx, output):
    """Generate writing table bonus milling yield SQL."""
    from lib.generate.milling import generate as run

    craft_root = ctx.obj['craft_root']
    output_path = Path(output) if output else None
    click.echo('Generating milling (writing table) loot...')
    result = run(craft_root, output_path)
    click.echo(click.style(f'  ✓ {result}', fg='green'))


@generate.command('prospecting')
@click.option('--output', '-o', type=click.Path(), default=None,
              help='Override output SQL file path.')
@click.pass_context
def gen_prospecting(ctx, output):
    """Generate jeweler's kit bonus prospecting yield SQL."""
    from lib.generate.prospecting import generate as run

    craft_root = ctx.obj['craft_root']
    output_path = Path(output) if output else None
    click.echo('Generating prospecting (jeweler\'s kit) loot...')
    result = run(craft_root, output_path)
    click.echo(click.style(f'  ✓ {result}', fg='green'))


@generate.command('disenchant')
@click.option('--output', '-o', type=click.Path(), default=None,
              help='Override output SQL file path.')
@click.pass_context
def gen_disenchant(ctx, output):
    """Generate runed rod bonus disenchant yield SQL."""
    from lib.generate.disenchant import generate as run

    craft_root = ctx.obj['craft_root']
    output_path = Path(output) if output else None
    click.echo('Generating disenchant (runed rod) loot...')
    result = run(craft_root, output_path)
    click.echo(click.style(f'  ✓ {result}', fg='green'))


@generate.command('all')
@click.pass_context
def gen_all(ctx):
    """Generate all F-001 profession tool loot SQL."""
    craft_root = ctx.obj['craft_root']

    generators = [
        ('herbalism (pruning shears)', 'lib.generate.herbalism'),
        ('mining (mining pick)', 'lib.generate.mining'),
        ('skinning (skinning knife)', 'lib.generate.skinning'),
        ('creature gathering', 'lib.generate.creature_gathering'),
        ('milling (writing table)', 'lib.generate.milling'),
        ("prospecting (jeweler's kit)", 'lib.generate.prospecting'),
        ('disenchant (runed rod)', 'lib.generate.disenchant'),
    ]

    for label, module_path in generators:
        click.echo(f'Generating {label} loot...')
        import importlib
        mod = importlib.import_module(module_path)
        result = mod.generate(craft_root)
        click.echo(click.style(f'  ✓ {result}', fg='green'))

    click.echo('')
    click.echo(click.style('All generators complete.', fg='green'))

module Latexmath::Latex
  class Rules

    param = Latexmath::Latex::Parameter.new(
      'InFractionStyle',
      [Latexmath::Core::Token::CC_BEGIN, Latexmath::Core::Token::CC_END]
    )
    # param.start_token = Latexmath::Core::Token::CC_BEGIN
    # param.end_token = Latexmath::Core::Token::CC_END
    # 16, 1, 11, 2, 1, 12, 12, 12, 10, 12, 10, 16, 12, 2
    Latexmath::Latex::Constructor.new(
      'frac',
      arguments: ['InFractionStyle', 'InFractionStyle'],
      class_name: 'Math::Fraction'
    )






    # DefParameterType('InFractionStyle', sub {
    #   $_[0]->readArg; },
    # beforeDigest => sub {
    #   $_[0]->bgroup;
    #   MergeFont(fraction => 1); },
    # afterDigest => sub {
    #   $_[0]->egroup; },
    # reversion => sub { (T_BEGIN, Revert($_[0]), T_END); });

    # DefConstructor('\frac InFractionStyle InFractionStyle',
    #   "<ltx:XMApp>"
    #     . "<ltx:XMTok meaning='divide' role='FRACOP' mathstyle='#mathstyle'/>"
    #     . "<ltx:XMArg>#1</ltx:XMArg><ltx:XMArg>#2</ltx:XMArg>"
    #     . "</ltx:XMApp>",
    #   sizer      => sub { fracSizer($_[0]->getArg(1), $_[0]->getArg(2)); },
    #   properties => { mathstyle => sub { LookupValue('font')->getMathstyle; } });
  end
end

require 'spec_helper'

describe MemoryManager do
  it '1. Gerencia uma fila com uma tarefa.' do
    memory = <<~MEMORYTASKS.chomp
      A123:50
    MEMORYTASKS

    expect(MemoryManager.new.enqueue(memory)).to eq ("A123")
  end

  it '2. Gerencia uma fila com duas tarefas.' do
    memory = <<~MEMORYTASKS.chomp
      A123:50 A456:40
    MEMORYTASKS

    expect(MemoryManager.new.enqueue(memory)).to eq ("A123 A456")
  end

  it '3. Gerencia duas filas com quatro tarefas.' do
    memory = <<~MEMORYTASKS.chomp
      A123:50 A456:70
      B123:30 B456:20
    MEMORYTASKS

    queue_line = <<~QUEUE.chomp
      A123 B456
      B123 A456
    QUEUE

    expect(MemoryManager.new.enqueue(memory)).to eq (queue_line)
  end

  it '4. Gerencia três filas com múltiplas tarefas.' do
    memory = <<~MEMORYTASKS.chomp
     A123:50 A456:20 A789:30 A234:10
     B123:10 B456:10 B789:120 B234:20
     C123:30 C456:40 C789:40 C234:100
    MEMORYTASKS

    queue_line = <<~QUEUE.chomp
      A123 B789
      B123 A456 B456 A789 C789
      C123 C456 A234 B234 C234
    QUEUE

    expect(MemoryManager.new.enqueue(memory)).to eq (queue_line)
  end

  it '5. Gerencia múltiplas filas de tarefas.' do
    memory = <<~MEMORYTASKS.chomp
      A123:50 A456:20 A789:30 A234:10 A345:80 A567:30
      B123:10 B456:10 B789:120 B234:20 B345:20 B567:100
      C123:30 C456:40 C789:40 C234:10 C456:60 C567:20
      D123:80 D456:60 D789:20 D234:40 D456:70 D567:30
      E123:60 E456:70 E789:30 E234:130 E456:80 E567:80
      F123:10 F456:80 F789:80 F234:20 F456:20 F567:30
      G123:20 G456:30 G789:40 G234:90 G456:10 G567:90
    MEMORYTASKS

    queue_line = <<~QUEUE.chomp
      A123 G456 C789 E234
      B123 A456 E456 G789 A345 C567 F567
      C123 F456 B234 G234 D567
      D123 D789 A234 C234 F234 B345 D456 E567
      E123 A789 F789 E456
      F123 B456 C456 B789 F456 G456 A567 G567
      G123 D456 E789 D234 C456 B567
    QUEUE

    expect(MemoryManager.new.enqueue(memory)).to eq (queue_line)
  end
end
